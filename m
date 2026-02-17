Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92162280A29
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353365; cv=none; b=jTqCkq/ekq95JOkusA4wqxyCBU7quhJub6mE77krkl0RZ1u6W2RVu/pHVWXxzj+LjRRXZmTMeRun8qf+Sy6ablwjqbyn3VfEk4j7A/b9SO+umFQV95qZjVhhB0QcoZjksFCJFtSYRJNEh+uoZlfMb2yg3rKwHoH5plUcGH4i9aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353365; c=relaxed/simple;
	bh=9uAHBw/2TpRNgIOnjFladpYu34dzrYRFTycnroCjZ3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLR7K6PQ4TtYHe9dF0vz+KqzgDy7KbADlPXNgTRdn4WdgQSx3lPDu81/MzPFOhNUMjPbaFMy+WHM58IDpyD6IluN3IWKl3LC+6P/5yowLtLONCAsn6DMi7NirfH+j1xiScZUmcrPd2g3FB69hYwTpCtp3eF+133VvrS4ciHfRWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJoYPYWQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaUbNVA3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJoYPYWQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaUbNVA3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB3hb01942880
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMrQyicAZEEqH/BJVyGmHveM
	n6L1dPKlkyYCF6REmA4=; b=PJoYPYWQuUsB5FEZvA830Cal0DSGAMo+QGMVb6W5
	+dkW/CDoED86KiVFlyG//hqnjoEscrW4RLYHTuM9ACB5yFBkz1qYTYyJrbsef951
	j1iRi75pMnls7+m0t660Cuu1/7TRi6O1B9IgeLY2ZpQijJ+IfsFmsr8AsFdoCsu8
	GnvCWUwr0VmtccVe2H/8bIP+CnqKzc20mjEFOJWZBeAgDweS2CeGT2SoULFxFlbJ
	VXC6CkXFWByQXTsusr7jbwnJXgTIZaa/gjd6wba+gTqepAPx2QNIzf7W9gqMc680
	7UUdi6G34Dgvr7IYZu7HWjYs714WfEzqQrEJWJtrKmoP3Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g1f09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:36:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824f75919f4so4852991b3a.2
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353362; x=1771958162; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=;
        b=gaUbNVA3z5PjX6ofgBu02EfQ18LbgHqoLZNuBH6suVjA23kO78tEcxpZZKYQ3Sn7+b
         QgbUdmtvjizS72fqN+XgaMYaZI9tKu1xYo6ItC6AS7oibjrR7rTvLbGEIB0naxOO9jWw
         waLgo0aD25p7VskVBblkFLzDLmo+C/XzjKdNPHFWoVGDi2CwzSWYQAEchJwKLeROKjXx
         3BvHjp83mXCkOrPhTDsn4eKuR5uzMyzJPWsUNZu+vb5JMgYVFcYLosFUe6JOH7+vx2Zl
         SpYbmr8gz9ZFmMA1HdRANKvOzF/cd2pkVWZHFck3pNfVIw9hADwKsFIeTgBcyJOP+BP+
         z/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353362; x=1771958162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=;
        b=CiEJ4N6blwPkz+LIrDFwg2vNp+zNSesa0/6FBLJEELw+8BCKOByEaIAtLex+vqcCac
         Kmjp6GSsRcAYCucQ7LvssGYbW/hCfw9SIx1jz77zQodC4h4MVpKikxQHI7yhwTg/R9PM
         4UaVYTrmJFvOfDyonsXPI8OLDDczCdKf+y1Ga0rIC7IdGfBYZozRMebAS/FpuxsKkSUx
         3/AThc8GpTDUfoi6OTbazHFETHq+5kd+CNj+5AdYjYc+MlMJsb0xk5sNtvbDQwq3rFRl
         Wc1xo8H4QwUcHajjyzb7zC4XeoMvqMwaxifLJAfNK807SRDAyViH2ZCTz5NMWj2iQhLM
         Yg9g==
X-Forwarded-Encrypted: i=1; AJvYcCXXBA4e9En3c/ynNhWafholWYhJivwWzoGVOSCBY2tIuMJhghD48ecDxh2bSVoJhhwcAVU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfhEjjdvT+RdI6dgCxD5baRikXqMozUKqAi/9758t89KbVj+H0
	kM2PfgWixNkMLiUsHr6PV9GBQzV9C6C7UkMVAWzWZ1RPY66I6yfZWtj0sYBesiB+NrE72jmVqWw
	fUZK4WMOOvsD4VfrFUZAWiWCUDIHdA8NaCcsN7vEXz29z2VmZpHtH0i0=
X-Gm-Gg: AZuq6aItkzl93KNTSTovPR8cWM9epL8Tmgau1YXDAPUwwB1D5f0yAZ9peLQL03F2nRB
	C7ilqx733+SfixCgEDIJTzRaTh5/6DPAcjKWBrMGn9/s7IY3KmMISXP0dV0LQuA2f3RWLgac9g6
	dAC28d8hOEeNZsBBDXPhNSeTq4Bg5uOtz8Mot4RBb69a0AAJijRtoPHNqQ8QDA+yq4xmae+qEwp
	Xje/3mUw30Q01h8MheYzyfGC3Y9HsQAUMW6GwndlzmqRiJ+t637kDey7l+Td64Ladnjad1hoE2v
	qWCG/1JjPQy59Uvwuhkrp4rCUba1GjQanZpVZ8J2RxXcmkTIoJsLES7ODUCLojXjCw2a1MhTZBp
	J+tcBSZ1S5/VAUnf9EU4VxjxAc5EW/VzzTcc=
X-Received: by 2002:a05:6a00:808e:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-824c5ea230bmr15684875b3a.11.1771353362499;
        Tue, 17 Feb 2026 10:36:02 -0800 (PST)
X-Received: by 2002:a05:6a00:808e:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-824c5ea230bmr15684842b3a.11.1771353361950;
        Tue, 17 Feb 2026 10:36:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm13401027b3a.30.2026.02.17.10.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:36:01 -0800 (PST)
Date: Wed, 18 Feb 2026 00:05:54 +0530
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
Subject: Re: [PATCH RFC net-next 3/9] net: stmmac: qcom-ethqos: change
 ethqos_configure*() to return void
Message-ID: <aZS1CigRWTH12scL@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX1LKrXk0k5lBi
 v4GNecr6q3ksyKpV8lT3i9HKuhSKGtlRBh+YNMqQyzWJnCjuB0BFb7poHH0ahqAGZD+zG93r+sv
 /IZvnXCNJxYa2Noa2euY9RPFwky0fkzXUAJvzaCWDwKbClP8//DXKotfNPqE6/cq3XsUv4tYIO/
 DjhhOcWP6RyCIXzJWh7Bbyjy6LnuHmgFQcZbopboZtkzMvT7mAFSOI+p0P9ok3dkHfmnvGfzAyh
 x+gtPWtN6zyslGbkeu6mhn5kRsE2zC76ykGeZaaQVzmV7WaF6dbr5x78NAVwj60J8R94SJCtvJ0
 LyHwRAM7dHwGCtgdy3XK/N8YGea5sonBtGaRSYkmTsdXYs0qeAAFKlxSN8CUNi7hfJAzCbWrmLg
 8e65HH6GHZ2/OBXrD/Ru3NtmiuwADUu+pqkG6GF4Ne/qO60Luyfc65wmhHrf/yEUEGjRY4p3tFA
 js2S95FLsxTCo0Q1ukQ==
X-Proofpoint-ORIG-GUID: Qy9FygYOB-6US8aXjeO_jnojgMdRuw6x
X-Proofpoint-GUID: Qy9FygYOB-6US8aXjeO_jnojgMdRuw6x
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994b513 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=OS3fFONSsTUfBaauNq0A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170152

On Thu, Feb 12, 2026 at 12:17:56AM +0000, Russell King (Oracle) wrote:
> The ethqos_configure*() family of functions always return zero, and the
> return value is never checked. Change the int return type to void.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
