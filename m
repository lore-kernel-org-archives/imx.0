Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021F9280A29
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353311; cv=none; b=Hf4cDqcRabnwWDYMyTyQ/eM4w51NdVejTGssVqkNkGrmYc/wZ2N6HTFzLNCWA/xaUjcRKWPamJdYETs+gbg8fdW1jHokEy4AkKb1OBqtNQzBPgC6USasD9r2tV5qm6EfnmbP0hOEHXqy4QJp7pQc0kc24r+IhZmYR79ZOH2D+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353311; c=relaxed/simple;
	bh=dvn4WhoeyZ48zTOLiekWToB7p0p7kq21LM0Em3rfrXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObJ33NzxAWpW7BvPEZmiWP2HQZ7F3b4pSW1GlC/FhaoBhbdLUHBeo4nK6r23qHQRGgb+bsv3GeOZ7j9SfmxlF3PANiZSeOw7/GGfb0XvhQYKsZ5ryG6A2clbP8ucrRhXD2VbHysDlPHFn0zblDpQutLi/vCcQRfqJPONXni5fiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDgF3v2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blBTulmv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDgF3v2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blBTulmv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBxsQW1935465
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=whCFM/BSXgDYxgAJq7FXzzvO
	BcHA3JZlYE1RiqYzwa0=; b=RDgF3v2wzcsLhhMnH8jJtVlwHjzy/EmJS8YH71Tp
	knkpCG1Zd1yevXd10FcYSMEOEq2LtaMVSWqlWjGFlsZDZePz7mYyemc9eXkRQPAn
	OrRoeWRnSadtiHSvmEVEZAzhVmhC8bCQfZiGu3CIKGaKUG4lqLu1ZED0R4XpqubW
	035XsnUYSPWYNpS4mGmrj4KLyepupzJ6tBOuh7T+z0sPIXhr20EwdflWj/sdY2I2
	t+TeyoPQzbqkJRbueblz5w+iaXG9OawdWvbVW/Nqwh58LaPZ+vcWJDJqVT03J07D
	TL/knQp3vOUmSTureJz+tpOZLkSCpScafXm9cI9QUq4b/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662ujwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:35:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab0b2e804cso55417415ad.3
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353308; x=1771958108; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=;
        b=blBTulmvW6A01eSoAuTIVijRleW4MoPoovP+eQY+lEjTm+6l8UpiKelfgIX73Ko6nT
         MmqzBqwWdyAAxn1AmFSaw3R0pjZRTzVzwG6ytXlCGshp5NtKtYnyDk1P7oTIvaNBVIfX
         gxMT3yaQPRB1MCofWtcUPhJqV2BzB87pQIntZGjwC/l87snYHU5yCAVtQ8ee12B9b/IN
         4vZK6rwB4qBDKKzvesIjADArSRwRjzBSZPX97VZ59Wt+F/Q/DzYMII1wv7jTDmQTbLRw
         cKwitk/M2Kcf7U4ED+2UICcDEJtZOvxzByIqv8OaJwdZjh2Gx2tpsSiPcz7ZMzkVlCBd
         Gzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353308; x=1771958108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=;
        b=gObzoTXkjCyHqMMkTU5AulquHUgJ05Xm2WSkIruNRaBL5AfnJImfA1rCmzXa/rAhsa
         95KDjEklID2W2Mn+WIEi2XYu2gbDfFf/Xa+/RAK/AeU1LwvnD7ST+bpk9ShIG4TBwj9E
         H4DdqYyOsnfMpvvM5GrVncRe93KyR0r5dukxy8mz5UqXkWY10xXfJvYAKWqWn8KY/3zR
         BPX6n5YL/oOjUOqSdSkNewzqv1lOCDuKB1TfPaDTF4eYZyi5eQDwAVnXJQ7JUD4fEeNg
         Ln/o78lCEOKDXHLPj5JzQdbm/3tDqY7+pPKjDK3GY7NFwRWQRH5i0Tt3f6ftPI4l/wt9
         CYZw==
X-Forwarded-Encrypted: i=1; AJvYcCUsuibyVq3tFoiElczKV9OidqVySxzgxidQvtGRb9Rr0iBPyr8hZSn6YqUlvv0z/21Vp8w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+dtCbI2irZD4/NTo6HsxOUMoeGNYuuEVfDu8h6iH9QGiw74B0
	8b5ri8aESzBCRY4MR56qjDey9QVv7o1AHVBc3aNfSkOEU1RY0RCC09YCpvufB7c7WoVbli5T9kI
	2vPRDjCTMSy2pDQAMbIRORfYfw752cpMWsEFxVBWV84LqgY8XozuLsm0=
X-Gm-Gg: AZuq6aLH+/M5SE3UpDmthbcKCxEuRcVZr8P479iYC5U0zcYX5Fo1MWqQdVtedgfQLoL
	R3WdeooFWbR/fR8FdaW8oSDTbUU0pqtMH9X5ZYFSbONaNlhVLEhDk9kuBJM0Tay2T6P1cjxHWL9
	eW2qxPjYbJu4IonXCAVekLo4bPqV1TtJ4K3UNz43bqE37HNcIpcifUjWSFQk3KsMgNJX/4mdM8H
	tHhXYkq4mxh7dU0AHphoocxuwwe9KMVeTTtCbs4KuGPMDpDh/k3IVYENLVRLMSG/v+8+Fo2mDZm
	6FaslChfyatAlpHOOdiB7quT9NXWMj2b7TvMJ74B0C8e28eczkYVr8N0S65fnaz5nvloFAu901D
	M/b4E+jFYR2Mq/PlNPdXClZe5wzroBM9Bv0g=
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab505b61bbmr154642425ad.37.1771353307775;
        Tue, 17 Feb 2026 10:35:07 -0800 (PST)
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab505b61bbmr154642075ad.37.1771353307166;
        Tue, 17 Feb 2026 10:35:07 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a713d5dsm180261815ad.29.2026.02.17.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:35:06 -0800 (PST)
Date: Wed, 18 Feb 2026 00:05:00 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 2/9] net: stmmac: qcom-ethqos: remove
 register field value obfuscations
Message-ID: <aZS01CotaSazpWvD@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKP1-000000093mH-0Sqo@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKP1-000000093mH-0Sqo@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfXw7fEBQcBudJU
 zz9apHZWTRZyLMfzJOqehS3AGoJUHq4/zgySrGKUIbRx31JF4iHGmdIokU/S80EHR0T1/IYdzIw
 2C9+GPmyBYgOocdic2X65Z+qcci+ZMfhoSzsV8cGCryr3Zz5gpmRLJcSl294mT1cCHsDke2t4ZQ
 CCoDcKy9GWfP/VlTPpd0M8HcDQWf4zHq/PoxkncvS9uvMLgFDZ5vVztykq8gvh5d0XlYJoXh9Tm
 YseaBhXC1s49hz69L8R2XDG4P7wu1VDo6zR4E7pJ8aJba6+NZcxGIi2jFi9TBGQDbi3+n9lw+4W
 FI3iD+AJ0/DKqgKiHCHknkw2mHjF8YPtc6qWBEg8XSTpOsfkleYR8dK2SDXFvBWG+uIqUCpO/dn
 hWl4oAV1B+DI27vR144yCvvpai5tMPzPjrcSvSBpPVkYQjNxSI/b8u8O0I6FMTojsxLtOTDzvfL
 S/6VV6j+g2LGL5EgV9Q==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6994b4dc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=eMU2cjtvKFU-KvXMnqsA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: HmuuEFMb9Sf5vRIVOEEJC24FdtUNSDtq
X-Proofpoint-ORIG-GUID: HmuuEFMb9Sf5vRIVOEEJC24FdtUNSDtq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170151

On Thu, Feb 12, 2026 at 12:17:51AM +0000, Russell King (Oracle) wrote:
> Convert the register field values to something more human readable.
> 
> For example, using (BIT(29) | BIT(27)) to update a register field that
> consists of bits 29:27 is an obfuscated way of writing decimal 5 for
> this field. The comment above needs to explain that this value is 5.
> 
> Worse still is BIT(12) | GENMASK(9, 8), which is used to hide the
> decimal value 19 for the bitfield 16:8.
> 
> Fix these, and a few others by using FIELD_PREP(). While it means we
> have bare numeric constants, this is more preferable than having the
> obfuscation.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
