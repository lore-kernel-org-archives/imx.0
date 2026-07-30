Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D84E392831
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 15:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424314; cv=none; b=aBza1E/3II9TLQdeO3gkfMi9y4oKbHFneAvj4fGyse8DL34oYMJBT0PkPCZlJ0umQctbas5kZdQdOC4kOlpf52KYtjk0fOACq1MJY5OdfNqUa5eLl8KH0Z0D7cxLVyHIwFxtQumy1KBPUazNL5wmSy9T6mTpNNT3Yp2v+jEjGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424314; c=relaxed/simple;
	bh=RvcZVjuOsIC9Pl51wsUOC0pP2H+JVwoWnQa1/cpsOJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0/arqLs1sRxQxO+PHXg52izo+/Idl4VAfJ7HJ3R2FxLIByYEqGtu9bDiqw5NdUcs3ZP5i4wbBpHBMxYZ1TD8Uf0kLBUwyfJsOIbw3WERXbOuxsurkaDpDYHol+hJ37CaA/j4Z+OoM/+69w/5gCI3aelEyLHvLKD8d0+E7vM0t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtGHCuSi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyScLApX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtGHCuSi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyScLApX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEh43Z1384853
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 15:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=; b=AtGHCuSiYuVCSyDB
	NXsCgob1HGbcw+bTaX/ykigECm46dZJ4mqp1Mxw+2+2/qCVlHBWB0oQ/t8b/WV0k
	Y3oz4rphSriOLDUrhNf3HVx7+5GWQYVFvw/sQwNkbDcV5mrwl8b44lb2qZSY0oMb
	3jXpFGrhaeSmovs1iFKELE5mg2/0KILXGyTpSfxt3AI4gJD8SYMmNsIszYN4fYL6
	cvLRHfciHpiImZJU0F5gcQrko/Mc4CCH4sG4UD8UfKimHEZqvlgw7aZtoeD3Xzqz
	Irhyylth0rOs4qjViEghhNktRMQCpBxecwyTaF6lg83+QexFbT51WnuAUhvtm3pq
	KOyj7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md054r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 15:11:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so26190811cf.1
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 08:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424311; x=1786029111; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=;
        b=cyScLApXWr5FnALcbW/fADYtvyH0zl9hqEEVHpLK/+oo+D+GnxduL0PSu0isQ48xPK
         0v6hvYmJ94en+DvQs83sHbqo88AA1pAMbCs92ovBZZupKnfWVQOQ3UpXIqN36WhzxW4R
         0jV9hUUPbyLO9ppdsGqOsdXXs4r4qMbaYd8lO7EqUdgg2DcZqHDzEPPiOjgc8g8iuXPy
         6NzU6bK0DnORoum+srSJGS6mHAOFlRulGNj4hy5OgKrPhMJseqp5+zAIFP4DN9Rn7S3j
         hmZuUITxBP2iX4otYBOCyCltL0dM5G81TR9H70l4kt3ca699Rqy4iqfY77AoWiDxb9/Q
         4hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424311; x=1786029111;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=;
        b=o9VWDPR2ub+jKCKv3X5O/iPqpxNhXUFSnZBHLjf83XgUjg6bTTAAEiNE+nQMisjEnJ
         USQLs/YlVp89EzVjZo6DHsApI3KYBdlF/GeSigwEN0BoXbBZsI1LD8Nmtes8FVNyMvXV
         7QVLPLJBiJJwWxsdLZxpnGjGk083rreruJQrQG/sMjg4rMCLoYwU8qSdIZSA7dGC0b5u
         Xzt6rfHeKKQ7rCDl9/NK81Ns1pBkfaNc6OZDeit/27vHNMF6GDNT6BFe72ps2FZZoFGq
         jRuwwnDMEcDm5F6QmL7cxH5mCl1UexOYnv0IK8kXjD6k2ztSA+OCQKVZTxeuBcyCM86d
         WVEw==
X-Forwarded-Encrypted: i=1; AHgh+RproWn9VBTWsYYx0K5izMVvD5mRlmr0fphLVcj2o9TkrrRxK7tWptLznTasuyOrNel9CvA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk5KNY6ViXSm9MBvncA3onOmlQpwE9LVrzNh3kprMbaxwwKAxJ
	dQM4QzupiFijOv99adisosvMv1WYvUuE5UOhyTFumUx2zGsryeCh4E7sZNqB9pzcquZfMRRBwZl
	XHyWBiEHrvrBB9XlxF0+p23l7AhELmgLOvFmMvozX8m6GnVAedyiXGuk=
X-Gm-Gg: AR+sD11NArQu9Xc+q69ncLs6WvzK+Ndx3pqHnlb8pI4wgGBqrws+Q2yxa0d/4uXNgEM
	CrkSdKmWCb7CCyvj07WR10uTMjmpMx6EdmoRcFWfGV/j2sSltAVkeCJhLNTY8MQAFMyvIOmx7r1
	pCK4wQtCyEqOeQHPXWEmtxknRZeyxB7ve724TByvxF0NMAp0o2tXnPHp1UPKkT5w3BC15sDAFgM
	VbIkBl269lUuInf20DgxrCIu60ioRj2P2wDmmPYthcn8Sil/dRglRY31qCkj+eZDAJnI75LaJkW
	pE9SyNyaEJ11L+6fVZvSTT9d++I7tPUw+yE/BvIGfMMGChqAdsnuH1I3mI5wTtc1VHIgU5IOies
	TLauMVO3bIKJ/19yZP335f72svSY=
X-Received: by 2002:a05:622a:4b14:b0:528:3ae6:14d7 with SMTP id d75a77b69052e-52b38768f8bmr27763151cf.59.1785424310904;
        Thu, 30 Jul 2026 08:11:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4b14:b0:528:3ae6:14d7 with SMTP id d75a77b69052e-52b38768f8bmr27762461cf.59.1785424310154;
        Thu, 30 Jul 2026 08:11:50 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f19bb3sm64581405e9.4.2026.07.30.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:11:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, bmasney@redhat.com, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
Date: Thu, 30 Jul 2026 18:11:34 +0300
Message-ID: <178542193568.317194.17709997600643119798.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
References: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b69b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=J2BI-d2c5pDyFB2YWN0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 4Vy3O9yBjjE5Nvyku47qG3gqCk3SGk2p
X-Proofpoint-GUID: 4Vy3O9yBjjE5Nvyku47qG3gqCk3SGk2p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX/8dDoZNZWbUy
 iLgiBkGhepscLOvZfNDErXy/i6630sit2y3KjvOPP7YlGyWcyenUEXoBh7iMfef/j3bMepZJ6Oj
 R5HVGuEhF6QH+QQbPFvVEkHWcnaWQcc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX3v9UC7oU9MYX
 a/wXyrU5L6ePH0O6PEyDyGfSLuLXqN6CrPSo9yKX+bfclq+RRWbQozbxKLYfjZeblEzwDQBVIdb
 kZmtcRt2XzSqFNk0Y1zCvggis/T3CxhiqOUVmC/qCD2YgYfvV0Zlg9py1XDznRMmjZYh3cgVmOD
 0CXHzxav7+VpPSDoqZmL480vIU1hkcSqFvgVrdHwOKI7GSXDljKtR5uZ1HmffR8FekNXdOSqZZP
 AyhJqav2aoB23rl/OqK+eW/UFEP1IKT37c928dz2uJnhElEMENbQY/oEjKzMPXs7a03z8ymsrKZ
 yg9b9rY41OVMoodjZbwLnPxJP4jeOuL6F9WerSiYjFTwybgOrN+DVo7/d61OtIM10whcrMyrt1k
 tZVUV2yUgvRzoW3vprDNTcP3rekNpw+Mq4EqyKwGajN9eSVqNR5F/NvDmG5LUy/0HKH49wjOfY+
 rPlNG9pysC/YHrbbfsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300115


On Thu, 30 Jul 2026 16:55:42 +0800, hongxing.zhu@oss.nxp.com wrote:
> Add a func_out_en clock for i.MX9x PCIe to serve as the parent gate clock
> of the CREF_EN (BIT6) gate clock. Both of these two gate clocks enable
> the output of the internal 100MHz differential reference clock.
> 
> When the internal PLL clock is used as the PCIe reference clock, both
> BIT6 (CREF_EN) and BIT2 (FUNC_OUTPUT_EN) control the PCIE_REF_OUT_CLK.
> 
> [...]

Applied, thanks!

[1/1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
      commit: 884dfb2dfe2cde33b8efe91ebf91542c88ca9034

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
