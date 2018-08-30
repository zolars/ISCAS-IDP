package hibernatePOJO;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "event_environment", schema = "test", catalog = "")
public class EventEnvironment {
    private int eeid;
    private Timestamp time;
    private String name;
    private String location;
    private String type;
    private String content;
    private Timestamp occurtime;
    private String signature;
    private String annotation;

    @Id
    @Column(name = "eeid", nullable = false)
    public int getEeid() {
        return eeid;
    }

    public void setEeid(int eeid) {
        this.eeid = eeid;
    }

    @Basic
    @Column(name = "time", nullable = true)
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "location", nullable = true, length = 255)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "type", nullable = true, length = 255)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "content", nullable = true, length = 255)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "occurtime", nullable = true)
    public Timestamp getOccurtime() {
        return occurtime;
    }

    public void setOccurtime(Timestamp occurtime) {
        this.occurtime = occurtime;
    }

    @Basic
    @Column(name = "signature", nullable = true, length = 255)
    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    @Basic
    @Column(name = "annotation", nullable = true, length = 255)
    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EventEnvironment that = (EventEnvironment) o;
        return eeid == that.eeid &&
                Objects.equals(time, that.time) &&
                Objects.equals(name, that.name) &&
                Objects.equals(location, that.location) &&
                Objects.equals(type, that.type) &&
                Objects.equals(content, that.content) &&
                Objects.equals(occurtime, that.occurtime) &&
                Objects.equals(signature, that.signature) &&
                Objects.equals(annotation, that.annotation);
    }

    @Override
    public int hashCode() {

        return Objects.hash(eeid, time, name, location, type, content, occurtime, signature, annotation);
    }
}