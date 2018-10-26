package grabData;

import Util.HBSessionDaoImpl;
import hibernatePOJO.DevicesThreshold;
import hibernatePOJO.DictionaryThreshold;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.socket.SocketChannel;

import java.util.List;
import java.util.Map;

//import com.sun.tools.javac.util.Convert;

class ThresholdClientHandler extends ChannelInboundHandlerAdapter {
    private Map<String, Float> map = null;
    private List<DictionaryThreshold> dicThreshold = null;
    private ByteBuf recMsg = null;

    private int slaveId;
    private int fCode;
    private int addr1;
    private int addr2;
    private int len;
    private String[] name = new String[643];
    private Integer[] factor = new Integer[643];

    private int part = 0;
    private int count = 0;

    //监测点id
    private String did = "";

    public ThresholdClientHandler(String did) {
        this.did = did;
    }

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        HBSessionDaoImpl hbsessionDao = new HBSessionDaoImpl();
        List<DictionaryThreshold> dicThreshold = hbsessionDao.search(
                "FROM DictionaryThreshold");

        String address = ctx.channel().remoteAddress().toString().replace("/", "");
        System.out.println("ip+端口为：" + address + "开始建立通讯");

        for (int i = 0; i < dicThreshold.size(); i++) {
            slaveId = 1;
            fCode = dicThreshold.get(i).getFunctioncode();
            addr1 = dicThreshold.get(i).getAddr1();
            addr2 = dicThreshold.get(i).getAddr2();
            len = 4;

            String thsholdname = dicThreshold.get(i).getDescription();

            DevicesThreshold dt = (DevicesThreshold) hbsessionDao.getFirst(
                    "FROM DevicesThreshold where name='" + thsholdname + "' and level = 1");

            if (dt != null) {
                Float value = null;

                if (dt.getFloorval() != null) {
                    double dfval = dt.getFloorval();
                    value = (float) dfval;
                } else if (dt.getCellval() != null) {
                    double dcval = dt.getCellval();
                    value = (float) dcval;
                }

                if (!value.equals(null)) {

                    ByteBuf sendMsg = ctx.alloc().buffer();

                    int addr = addr1 * 100 + addr2;
                    value = (float) 0.1;
                    //int addr = 8000;
                    //float value = (float) 1.1111;
                    sendMsg.writeBytes(createMsg(addr, value));
                    //System.out.println("send:" + ByteBufUtil.hexDump(sendMsg));//打印发送数据

                    SocketChannel sc = (SocketChannel) ctx.channel();
                    sc.writeAndFlush(sendMsg);
                }
            }
        }
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        cause.printStackTrace();
        ctx.close();
    }

    public static byte[] hexStrToByteArray(String str) {
        if (str == null) {
            return null;
        }
        if (str.length() == 0) {
            return new byte[0];
        }
        byte[] byteArray = new byte[str.length() / 2];
        for (int i = 0; i < byteArray.length; i++) {
            String subStr = str.substring(2 * i, 2 * i + 2);
            byteArray[i] = ((byte) Integer.parseInt(subStr, 16));
        }
        return byteArray;
    }

    private static byte[] createMsg(int addr, float value) {

        byte[] msg = new byte[17];
        msg[0] = 0;
        msg[1] = 0;
        msg[2] = 0;
        msg[3] = 0;
        msg[4] = 0;
        msg[5] = (byte) 0x0b;
        msg[6] = (byte) 0x01;
        msg[7] = (byte) 0x10;

        byte[] addrByte = hexStrToByteArray(Integer.toString(addr));
        msg[8] = (byte) addrByte[0];
        msg[9] = (byte) addrByte[1];

        msg[10] = (byte) 0x00;
        msg[11] = (byte) 0x02;
        msg[12] = (byte) 0x04; // 写入数据长度为4字节

        String hexValueStr = Integer.toHexString(Float.floatToIntBits(value));
        byte[] hexValueByte = hexStrToByteArray(hexValueStr);
        msg[13] = (byte) hexValueByte[0]; // 写入数据的第1个字节
        msg[14] = (byte) hexValueByte[1]; // 写入数据的第2个字节
        msg[15] = (byte) hexValueByte[2]; // 写入数据的第3个字节
        msg[16] = (byte) hexValueByte[3]; // 写入数据的第4个字节
        return msg;
    }

}
