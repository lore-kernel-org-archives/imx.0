Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AF52459C5
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516078; cv=none; b=AMKrVT0xUO5BYroKdtiN8M8K4+EXLOq9UBw1E04Gka6TSZ4aMhT3UoSHFSRj7aznMAgv0jTob8eRoFFnCSuh6VLkXSaJf7NIAbVBgNldBXd60i9k5XjoIX/D0IA+tTmLeseY8XXR7vEdwQ8ksP/5EKpk5ZOTWZXzh9OEAafqp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516078; c=relaxed/simple;
	bh=WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WyXMhUWVYFn2lcJpgKgKEi00WVTnbEhHTOqyLt2q7U77IpvlYDKmoa2PEL9cgczAQPJJlK7vf1s6jrdTCNGe192N4z960J+xKssG/aYDU2pH+kB/tJZ1CEpwdcTTgyMHIiTBV3uVjI1AInmdVY8wTx386takIeHbdyK1ibS0bXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhLue+T1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ezs0+lf9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhLue+T1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ezs0+lf9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C39LK2605298
	for <imx@lists.linux.dev>; Wed, 8 Jul 2026 13:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=; b=bhLue+T1HZS6Z1yl
	0SK7piGEP/m4bSiAAlhhNU1mTl4FX62J6rU1q96kA8aMseiY9ZWto/Dd+0Miw/MA
	mR4PyKQbN0+ZHEnUBucu6zOkAfsXEujfYWmhI1l4vmbj7e2jH7cR7VwXg/Z3crhN
	8NMEObbUbI6ULX1L6+S8JWxbOZ31JSqX/EATTSay9ArAKJaG68hvW+2EcXMK96to
	NoyER+PjRKSJ3ycZpb7+FNwNa/8pI5bYh5dQkZYYYmwi0kkWyLAdJpvqie26YbNn
	Nx4kVOvaFr1YQ5T3Dorvfj4wI18xfQdrLiWC94ltSqRHDt3vqchC2u6ywJgry83Q
	kdthGA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5ar47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 08 Jul 2026 13:07:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738e5b5ef68so201779137.1
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516075; x=1784120875; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=;
        b=Ezs0+lf9PD+gkw7BIiI50a42B5O1AR2c74rCbFj8eb911YWu8E+/bKqpkaE807rHTC
         EMTthPrS3RJEr4MX3guUgUV87vec68imgER0iu9hY/SnTT5uyQjywYHfKR1ZoXdC+4sU
         wYMpdg81YqMqw51o1FA2/JafxWypTOPsJqSDCXujshqf+SSWRTG9BuVCICGGCSvR1hnj
         cZ4KstaDOXs199LnKh0lBueSfCbz612ckyip2bB3CP1WTwKfMfY20gSpwO2f94/uaJ4B
         +lnERTJLdRxqow+LXihB+FldauKYA493yT5trvIgZBbEurXIswPurvDAQFQNgh8vsxW9
         vf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516075; x=1784120875;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=;
        b=jnu8ig+1WifxJWuHr+Itc67e4z5A9gFueaJOMscysrxIlM9qqJ5LaJHZh+ySqsMNsf
         eB8AispzSRMaVJmiZ+BBK0h59Zx9Vo0nZxm1VRyc8SivY0691CIYJ3Zik5mbP7SYBfwq
         4Ts7sLjmsFRbIUoOa75vcaRAECvi4pmyUawyNfTHT9xxeBKAgpuuniMSOPbNw2opSB52
         OVA5qbSxZmhLAL0bgsWDcHKILPx0FefZElx4XnDhx+LkT6gcAzJUB1gLcJvZedISHGxH
         M5ageY2LoZJF66us+w2HRM0N6NKkfA0DejUqJZPOfSoz4v/2IvtY2gpj4WFPekWQJQ8y
         ssBA==
X-Forwarded-Encrypted: i=1; AHgh+Rql9XMS0ZNpUxtTpVOb9dl3PCA00tGAll3P14mfwnMhuK9lWzIEejAvi3wVaqwJ73G1SxE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbe9JzLXsGPAyvfoUamZyZh/JExZp+XABGvXv+/3d53td2eAyk
	jbqwdpQGQY9XCDO6qpUCrzYRvmtbCNDfpoGlYIugpHbbT1SKCgeofZg1nerVdHYUS5NqzVYkftE
	ORC8ky/K1T+2tTLzmvS87hZTofc4lGRe7kEPVBxvFG9prKnmp/icabN0=
X-Gm-Gg: AfdE7cmvXx8xdkZggDdn5vzM8W41VIqa+KCG8Az7KhNhHwvid+sU7Zu3WYUL6Z03/SU
	/ykftpzg+MNsBe2XgST6MREDoqPaNh8/QQqp2oVCGZhHOYF48dVz7CGvANKeihidY8RoYMfriRn
	nj2XndJGZlY60HfSRsBFjIB5lIUiCZQLmTjFvD+iKji4Bus7LNRjjexJ3HczGi+AqkzIY2XI5Js
	afee/HKh1WjDFyYJYrP/GVL1ADLv+qQuuJto4/1H7C9TTCC7B8PIeLT3sXAfpayw+NbunnKtEe+
	qbzGybkNk8tqS1Aad3xLAePNWCf/Tvp5kvj3rXkXhcSiPmTsibmhc0kO4Y70tj+/Yb9Ry1dzWa1
	y3gIfySbkmnizmA==
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr1130787137.29.1783516075445;
        Wed, 08 Jul 2026 06:07:55 -0700 (PDT)
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr1130755137.29.1783516075014;
        Wed, 08 Jul 2026 06:07:55 -0700 (PDT)
Received: from localhost ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3ee7csm1525979137.2.2026.07.08.06.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 21:07:33 +0800
Message-Id: <DJT7OBVIB2J3.N6UA6SLKJXZB@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/9] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-3-b4e1ca053623@oss.qualcomm.com> <1c84099b-6f0d-4655-9aea-015a821b50db@suse.de>
In-Reply-To: <1c84099b-6f0d-4655-9aea-015a821b50db@suse.de>
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e4bac cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=lv_lVlItrp0lmarviNkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX6rEJOV57fQUF
 FqwyAWn29fm1vFbcuWM4IoKj+v9dF3EInGgGpQpZ0FRp7kS0zaf7bI2oM7O0ebGIVesGbJjykvC
 pz0f9FhMr505r3X1OqxOA8NHUPISrn0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfXzRO9nxt9ZaQE
 Z/SXJgb817lqiaGiMuzOJ7FujFj7f4cdy2AwtrDVqkUMr1LDwXeiEGuD61XAxrg7EjcuuczLkML
 U9dMdf76bEH4UtzygOnEdHJFUfGi6WnD4FiyUxGMJh/1+YN7YlKS125YaalE7a1iPRd83IHr+oF
 pxVu1X/0W8JKLxIaC0hAIF1GdUcT1DnjQJJjCAY/CsVPCV6PeFKjGZRudZGT2AYlVZi0nA14qWE
 PZySwbGN91uQJkjl8WdALrQexbddQ9mU/3fOo2CE8jw3cHpmEBpz35e7sTyB1dc13kAeY0wuSEf
 Q43/HrrU59fMtFcrezYVSy1urEkotgkM9TF9i1One0O7zWNZoZPj7q4Pye6ZzeJOANgITSEC7iA
 6kFVcQA0EfNODoDXO1LRqSbczCesqwWb8+xvV+ITi0RkhmFZjAACswk+bhp1k3x2b5CSLHd/0PH
 V4ZU+RmG8fAnZ151Q1g==
X-Proofpoint-ORIG-GUID: v0ke38nyoKLnKm9LmmD1xWMbRo9wzyeV
X-Proofpoint-GUID: v0ke38nyoKLnKm9LmmD1xWMbRo9wzyeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080127

On Wed Jul 8, 2026 at 8:44 PM CST, Thomas Zimmermann wrote:
> Hi,
>
> the imx driver is well maintained IIRC. I'd advise you to split off this=
=20
> patch from the series and send it out separately. That is more likely to=
=20
> catch the attention of the driver's maintainers.
>
> Best regards
> Thomas

OK, thanks
