package com.fengyukeji.questionnaire.bean;

import java.util.ArrayList;
import java.util.List;

public class QuetionnaireExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public QuetionnaireExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andQuesNumIsNull() {
            addCriterion("ques_num is null");
            return (Criteria) this;
        }

        public Criteria andQuesNumIsNotNull() {
            addCriterion("ques_num is not null");
            return (Criteria) this;
        }

        public Criteria andQuesNumEqualTo(Integer value) {
            addCriterion("ques_num =", value, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumNotEqualTo(Integer value) {
            addCriterion("ques_num <>", value, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumGreaterThan(Integer value) {
            addCriterion("ques_num >", value, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("ques_num >=", value, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumLessThan(Integer value) {
            addCriterion("ques_num <", value, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumLessThanOrEqualTo(Integer value) {
            addCriterion("ques_num <=", value, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumIn(List<Integer> values) {
            addCriterion("ques_num in", values, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumNotIn(List<Integer> values) {
            addCriterion("ques_num not in", values, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumBetween(Integer value1, Integer value2) {
            addCriterion("ques_num between", value1, value2, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesNumNotBetween(Integer value1, Integer value2) {
            addCriterion("ques_num not between", value1, value2, "quesNum");
            return (Criteria) this;
        }

        public Criteria andQuesStatuIsNull() {
            addCriterion("ques_statu is null");
            return (Criteria) this;
        }

        public Criteria andQuesStatuIsNotNull() {
            addCriterion("ques_statu is not null");
            return (Criteria) this;
        }

        public Criteria andQuesStatuEqualTo(Integer value) {
            addCriterion("ques_statu =", value, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuNotEqualTo(Integer value) {
            addCriterion("ques_statu <>", value, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuGreaterThan(Integer value) {
            addCriterion("ques_statu >", value, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuGreaterThanOrEqualTo(Integer value) {
            addCriterion("ques_statu >=", value, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuLessThan(Integer value) {
            addCriterion("ques_statu <", value, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuLessThanOrEqualTo(Integer value) {
            addCriterion("ques_statu <=", value, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuIn(List<Integer> values) {
            addCriterion("ques_statu in", values, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuNotIn(List<Integer> values) {
            addCriterion("ques_statu not in", values, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuBetween(Integer value1, Integer value2) {
            addCriterion("ques_statu between", value1, value2, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andQuesStatuNotBetween(Integer value1, Integer value2) {
            addCriterion("ques_statu not between", value1, value2, "quesStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuIsNull() {
            addCriterion("colle_statu is null");
            return (Criteria) this;
        }

        public Criteria andColleStatuIsNotNull() {
            addCriterion("colle_statu is not null");
            return (Criteria) this;
        }

        public Criteria andColleStatuEqualTo(Integer value) {
            addCriterion("colle_statu =", value, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuNotEqualTo(Integer value) {
            addCriterion("colle_statu <>", value, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuGreaterThan(Integer value) {
            addCriterion("colle_statu >", value, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuGreaterThanOrEqualTo(Integer value) {
            addCriterion("colle_statu >=", value, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuLessThan(Integer value) {
            addCriterion("colle_statu <", value, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuLessThanOrEqualTo(Integer value) {
            addCriterion("colle_statu <=", value, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuIn(List<Integer> values) {
            addCriterion("colle_statu in", values, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuNotIn(List<Integer> values) {
            addCriterion("colle_statu not in", values, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuBetween(Integer value1, Integer value2) {
            addCriterion("colle_statu between", value1, value2, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andColleStatuNotBetween(Integer value1, Integer value2) {
            addCriterion("colle_statu not between", value1, value2, "colleStatu");
            return (Criteria) this;
        }

        public Criteria andFabuAddressIsNull() {
            addCriterion("fabu_address is null");
            return (Criteria) this;
        }

        public Criteria andFabuAddressIsNotNull() {
            addCriterion("fabu_address is not null");
            return (Criteria) this;
        }

        public Criteria andFabuAddressEqualTo(String value) {
            addCriterion("fabu_address =", value, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressNotEqualTo(String value) {
            addCriterion("fabu_address <>", value, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressGreaterThan(String value) {
            addCriterion("fabu_address >", value, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressGreaterThanOrEqualTo(String value) {
            addCriterion("fabu_address >=", value, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressLessThan(String value) {
            addCriterion("fabu_address <", value, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressLessThanOrEqualTo(String value) {
            addCriterion("fabu_address <=", value, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressLike(String value) {
            addCriterion("fabu_address like", value, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressNotLike(String value) {
            addCriterion("fabu_address not like", value, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressIn(List<String> values) {
            addCriterion("fabu_address in", values, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressNotIn(List<String> values) {
            addCriterion("fabu_address not in", values, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressBetween(String value1, String value2) {
            addCriterion("fabu_address between", value1, value2, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andFabuAddressNotBetween(String value1, String value2) {
            addCriterion("fabu_address not between", value1, value2, "fabuAddress");
            return (Criteria) this;
        }

        public Criteria andCommentIsNull() {
            addCriterion("comment is null");
            return (Criteria) this;
        }

        public Criteria andCommentIsNotNull() {
            addCriterion("comment is not null");
            return (Criteria) this;
        }

        public Criteria andCommentEqualTo(String value) {
            addCriterion("comment =", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentNotEqualTo(String value) {
            addCriterion("comment <>", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentGreaterThan(String value) {
            addCriterion("comment >", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentGreaterThanOrEqualTo(String value) {
            addCriterion("comment >=", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentLessThan(String value) {
            addCriterion("comment <", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentLessThanOrEqualTo(String value) {
            addCriterion("comment <=", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentLike(String value) {
            addCriterion("comment like", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentNotLike(String value) {
            addCriterion("comment not like", value, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentIn(List<String> values) {
            addCriterion("comment in", values, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentNotIn(List<String> values) {
            addCriterion("comment not in", values, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentBetween(String value1, String value2) {
            addCriterion("comment between", value1, value2, "comment");
            return (Criteria) this;
        }

        public Criteria andCommentNotBetween(String value1, String value2) {
            addCriterion("comment not between", value1, value2, "comment");
            return (Criteria) this;
        }

        public Criteria andQuesDateIsNull() {
            addCriterion("ques_date is null");
            return (Criteria) this;
        }

        public Criteria andQuesDateIsNotNull() {
            addCriterion("ques_date is not null");
            return (Criteria) this;
        }

        public Criteria andQuesDateEqualTo(String value) {
            addCriterion("ques_date =", value, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateNotEqualTo(String value) {
            addCriterion("ques_date <>", value, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateGreaterThan(String value) {
            addCriterion("ques_date >", value, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateGreaterThanOrEqualTo(String value) {
            addCriterion("ques_date >=", value, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateLessThan(String value) {
            addCriterion("ques_date <", value, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateLessThanOrEqualTo(String value) {
            addCriterion("ques_date <=", value, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateLike(String value) {
            addCriterion("ques_date like", value, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateNotLike(String value) {
            addCriterion("ques_date not like", value, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateIn(List<String> values) {
            addCriterion("ques_date in", values, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateNotIn(List<String> values) {
            addCriterion("ques_date not in", values, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateBetween(String value1, String value2) {
            addCriterion("ques_date between", value1, value2, "quesDate");
            return (Criteria) this;
        }

        public Criteria andQuesDateNotBetween(String value1, String value2) {
            addCriterion("ques_date not between", value1, value2, "quesDate");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeIsNull() {
            addCriterion("confirm_type is null");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeIsNotNull() {
            addCriterion("confirm_type is not null");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeEqualTo(Integer value) {
            addCriterion("confirm_type =", value, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeNotEqualTo(Integer value) {
            addCriterion("confirm_type <>", value, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeGreaterThan(Integer value) {
            addCriterion("confirm_type >", value, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("confirm_type >=", value, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeLessThan(Integer value) {
            addCriterion("confirm_type <", value, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeLessThanOrEqualTo(Integer value) {
            addCriterion("confirm_type <=", value, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeIn(List<Integer> values) {
            addCriterion("confirm_type in", values, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeNotIn(List<Integer> values) {
            addCriterion("confirm_type not in", values, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeBetween(Integer value1, Integer value2) {
            addCriterion("confirm_type between", value1, value2, "confirmType");
            return (Criteria) this;
        }

        public Criteria andConfirmTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("confirm_type not between", value1, value2, "confirmType");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}