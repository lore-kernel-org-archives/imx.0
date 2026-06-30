Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000FF3ED5DA
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829111; cv=none; b=tuMjm8Iqqduys3RjsaPHk8C4L+yKzl823i6OUvW045NigytYwXYprxYQ4mtaheZM+TMJY4PvudVCnUy02UjDIo1HNEKbYB1VG6oyGwqxgINcU8PIWX6nuOEj+Tc8vFvji0qCXJhPK4XZf51S8GMzRDJ6aAPjRHMfX8ABJ5qJcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829111; c=relaxed/simple;
	bh=fuqUYcg8JyTJO77tUbShVZbGD6Q8Y0SM/8Do+nLvQAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r+9GDHt90SrUmF1r4dDpJNT+Ssr4nViMV6BZu//axmIms2RPgGxsO+xAY6JGFeBxxzqAvVhHSJnZFjvolPZy2taQY8VAmq45Z+lbjscz+vjZEBObHbQIyRfQUn2Jsw7iw7Y/iEu8y173RiNhEZPxav49cicN9px3G+t8kLeMEww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmyoA9Rv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkZ7sQ8y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmyoA9Rv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkZ7sQ8y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDCTR2199302
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 14:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=; b=BmyoA9RvOmEyPSGz
	4DdeycYqRg5PCw4Sxn8ZYj5d67/KDrOpCaGBDY7TZ6s+x+WiyiRV5ePHES5IeqAK
	iL/+cW5LWLx0rzSbXefMMWSHzBSI5/IOPq53z8xX3tPJna3JcK6LjNBY7bg2y02W
	oFJA+JjUPagK07YIJMMFCeoStdq9cTIDDQttRK5oFLySxr10PgFXYz7FmSNRfDfv
	sdmrYhSaQ5SpRlduvX6+DHOce0hqZxJV/ZC/MM843ibdoKzmO+WJ29Bv1o93F4jP
	OBn6Hu+ZqZ/NcLUMXU4xtxQ0MuNoEEjTvB5d7Z3xxODCim5c4aiadSyvKaR7lQzu
	/yyDoQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc080dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 14:18:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c011c7cb9so12801001eec.1
        for <imx@lists.linux.dev>; Tue, 30 Jun 2026 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782829108; x=1783433908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=;
        b=dkZ7sQ8yZ3RaRNOeel54QoQNLjObN5ZMVZ3fBUratwIt+ikHezoWpnDrd7/CFNnrjI
         HuJRG9EOveKKv4qEEs9giTdQvrB54bjYOhBHG+vwrgff1uoCSKdi78HBksU2uNZG2vor
         nL8NrXNLGeSWO8grLCzqA3uEGWSrUwlgzGnNTuE35A1vFZhE2tU9bO1VAacuPeE2/yLd
         M3aTAk5zfMaOdZGEMQtSc0pUL29ivDcNWh4yIaM/EAfHxm1LObZp7zSVjFcI2EGaX8W7
         W9LsuPGE8eEVbUPW/VCKjlZMUmBtdRSX2Z20ryP43eU+r8jo4DVg4hbinUNz7ldZzOOO
         lfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829108; x=1783433908;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=;
        b=YnO5ReVJ3LPY8aVerd+ytEWzp0h/paRWEXqF/PlQQipY6fURmK8Nsb0MIOTI59RIcc
         Dz45yMJ/3TLK5zxSGD9hb0aBQwmYkouHZNt/EYUa8OwwFxI5iWYH6OZumRuEwcbPMToK
         /lm/q0iMMXJWN47Heh+mVe//fUfn1K1e1JB1bmO9gtLh4niQTJKWweipYMVYja0HLOkJ
         Fb5DYX4En1GWg4k0i+SOdQ1fKUQG7aWoH0ttZbItzNDxq9flG2uRon29G9PdhK5ZIbzS
         iG7s3GwvQAFK9LqE+yv7r4hfQ09OvQQbAj4sDcDr/V1kdLI+g6y8AYWUM3u5TH5cGPAC
         4ivw==
X-Forwarded-Encrypted: i=1; AHgh+RrStmfgmx5S05SrAaDRXvlsv1UABuD7796JxcWFNXNrp8POFcwux45QhVJX6gttjKTlRkM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtX2hSzvkguJdylb3nsb0QZReOcinE21YZx1N6HcyOLOQgiY5Z
	Vx5O9ux3UiVOnEgCmhOWqWDY0bqagVrJ1RlitIjAZbZDoyAGLWzwN7rVTKbrZNkTR2ZsuuNwIfU
	FdfYfgEh8Oko3QLiiZL+3vcZiUxaQLJ2vILohuBniX/TcJqG95wWWlQI=
X-Gm-Gg: AfdE7ckqntZfY8iP9x/CSkJk3y+yYV8LpdjXHuLTPSFsWJDiv6+bKOSVq6d00WpKQIh
	BlfLk00snWWqsfqcImVvsnNMb3vaUlHphMkxTJtLydLmZflQ7vWJmFZnHZ56BV7vflWAtDa0zI6
	Z/hRhcssQ5MTP39VWbH7AZrdkTAVWyujN3vma3BORh/7UrcNouD1D4WyYLfd4g/hQfC5hpfi8Jl
	e0AfecLSHFvltG7oea/MyVMH5I5T69i+hqklAZplrKNf68tM4afKXX7By/CMjKOm/r5R7ZTaqkc
	6mVFvrHdcmSYD2AJUhVpVnYTzEo0OydA5kWMI2Yi4sO//OH3jpB6Fk37NDrtrXTT45BgkhHzpcO
	IsbL5jcOSYgU+ffPKKBVY4wVvF9raIQ==
X-Received: by 2002:a05:7300:f691:b0:30e:c1df:4592 with SMTP id 5a478bee46e88-30ee149bf8fmr3700862eec.34.1782829107802;
        Tue, 30 Jun 2026 07:18:27 -0700 (PDT)
X-Received: by 2002:a05:7300:f691:b0:30e:c1df:4592 with SMTP id 5a478bee46e88-30ee149bf8fmr3700817eec.34.1782829107056;
        Tue, 30 Jun 2026 07:18:27 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.61.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3170ef9sm13888083eec.16.2026.06.30.07.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:18:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260618092100.3669556-1-hongxing.zhu@oss.nxp.com>
References: <20260618092100.3669556-1-hongxing.zhu@oss.nxp.com>
Subject: Re: (subset) [PATCH v7 0/3] Add root port reset to support link
 recovery
Message-Id: <178282909958.294720.13302580439189608628.b4-ty@b4>
Date: Tue, 30 Jun 2026 16:18:19 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX9kRT/1K42JNy
 8qyBt5PIHOCebaJKN9zxp6u9naUFjMUWxzBf1h9kEdH2Thrdp2o2lLcO1P1NEOWZdsrIj3ksIBn
 4vcc2l8e2KlGm+DqWoHee1FNbwEIjLCqkAbcPg3Eai1U5FHTv9aZAsqY6t5uxEf2QvS4W0R7orE
 r6FifcHSTPRW33cziMeCw/L2ZBYRHnlIF/I8Ea7u+9AYa9+KUmHInxALf+r8rCTR3eycX1jcTa9
 a1TC8m5gzrtwmAZrkmQVNTEU210Dcg7ki0CVGEbkMzwhASiYrK3TJ4dGunefbZNienCPsnUPWbx
 5iJr4zwh+D8Ri8S/YBq6G4Dwgij3XzGDWBkVdSbTKIgjW6CJHCrIUpF4Y5pNxnDSV0HT6gHigY9
 /oGagXo+dJjAsO+75YH7wNkbvOrxAjBCJdmyG4CB4+lXKHL1DIBphprsNyHaLeozGcFSStpmUEn
 FE29ltUpvhdCz3ReL2Q==
X-Proofpoint-GUID: XqMQKCkJXwIIPfGms72984R5NngsR2DR
X-Proofpoint-ORIG-GUID: XqMQKCkJXwIIPfGms72984R5NngsR2DR
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a43d034 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=H7IkG6lIOHbWVTtTQWLpKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8AirrxEcAAAA:8 a=ccIQWBWPPgp-iIgOqYMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfXzGApoNcEjzcL
 0TjhD7wtD8U0C/yfJFNSG2XaT+5ql4mfnfjLoCwjUERP3GDiVVQd4TSUY/C1j/00EKHX8wI82p4
 Vk7OvCftkjeuZ4X71Fy8HyL9a+Gy6G8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300133


On Thu, 18 Jun 2026 17:20:57 +0800, hongxing.zhu@oss.nxp.com wrote:
> Based on the following patch-set[1] issued by Mani.
> Add support for resetting the Root Port for i.MX PCIe to enable link recovery.
> 
> [1] [PATCH v8 0/5] PCI: Add support for resetting the Root Ports in a platform specific way
> 
> PCIe links can go down due to various unexpected circumstances. This patch series
> adds root port reset support for link recovery on i.MX PCIe controllers when the
> optional "intr" interrupt is present.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: imx6q-pcie: Add optional intr/aer/pme interrupts for i.MX95
      commit: 7186ac21201a9a408ae80fcbb9c985c959b3febc

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


