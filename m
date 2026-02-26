Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1E82DECC2
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 06:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772088403; cv=none; b=WCsYFl56uCsukRIZzaj8uhxyJTDrKThrjWJ0v4wXayNRFX+MTfw7SHvI+Ek4cEKuY/J3mrj7OURsIUd8NadwSggZpUUbvYfnH49f37oHAZawY3KVyCgGHw1Pq3Wzt/q3YtzYjBuBXNGwjeICwaC6frUpcd8YvC5vdpm5WMdpPC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772088403; c=relaxed/simple;
	bh=MHprEKGJ7TJgPffHT6hB4hfpFsv6f68mRCwU1c78FkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Yr5fVPgjnmbV//5ll/r8sueLEgg+YgJvzG+VQ13EhEkZrmIE90jpUaEBVzF4pONI13atDTEiV28kEGMuNUSu7q+F+ZvoFRJS4kXAcvHM8bRWYfnsDxWOFhrxemAnXW1lciHPWZ9e9fImgpbMFIJgKqlbEGLs4TggkkTWidVAW7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzUw2lE6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5j3agw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzUw2lE6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5j3agw4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V4mx2996631
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 06:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtW2bFRzDCHNDseCd5JWULZWJjDZJJs0SedB2d4noy4=; b=RzUw2lE6O0S/GDw6
	x1tDc46Jr/9kjuoNhiTy2WNhpfLHRrh2nGDD59kj/i52bvXE3U5JGEtY0uS5iJUX
	cp5bxZm88mj4YILnU9VZtmT82AI579sfS79xQQDkHY5++1oP1+mZ+PrDci76Povn
	s4Syvu87xc0cmdUwfzQsXbXvYv8FTmjQK1TncyhVjXS+DTl+RXJKM9pN+BPAWMmg
	AEb3j/6cOgnDm/c4nTfxHx5jInHsuZzDLnh4W8wghEX3zbldubqudhyr1QQQB2ti
	5DkXMD5oOLP5C0z/ytkq38k6/s0c+y78XuGRiaAokSxXgPK9nuAEXuF+YfOs4kXM
	M/QBGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9k6c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 06:46:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso523400a91.0
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 22:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772088400; x=1772693200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtW2bFRzDCHNDseCd5JWULZWJjDZJJs0SedB2d4noy4=;
        b=O5j3agw4yz7L6+lqOjam2WjDjqEfU5MO2syM3Duw7cjgWrhRoqlOuszq0RpvsNbM8p
         EAqsWK/NaFJZbHRM9t7xTJrW7Rb7FgsBed2MBKzKjl6Ll2/5+d45+laRixYGB9C4exYW
         fI2ZThnewdmr7xFslIMma01RnmTk7PsdlP3Wl0sI0Grs+zf9Pionu1CCXrxeC2cNkIuq
         MNSXNJJGeaSVI6HyG2b/wt8mvpYc5MbvPuk2pSbjM2tb4LNaNAOVZRieXLN5fj3W37e6
         eXCnWzdD2lN0QOsgImeunWKf+e1DblHJugvxNYrfQLnly5NBnslOI+cDv1IQu0/aM78M
         9FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088400; x=1772693200;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtW2bFRzDCHNDseCd5JWULZWJjDZJJs0SedB2d4noy4=;
        b=MS6ion4Pw+9G+av2rkwg8Qte+hiblhyWrlqg6na0T5vpnGV1ky8+MySit911yuxEG2
         Esmln404B3RrND1YtTJ7J0I/KcKw5i1uZa+Y+s+MUeY2Sbjat2p+Vwa90dSXu7smj7Ih
         x4pOpEFxMSTRcMn2R7gkjaO+qr5r9L3XjWjQVZcF0xpbW4ekp1VnRc18LGo4Elzx6J4N
         hxiOH5/6xi48v3fGfspEaVXdHetKJipoeiBu1uNGVprfEXsW1aoEABIT+l0sXuu6F+mg
         INyDa7lxGSq6r0TuSREsQuy2DqJkK4WkExKF8ZsF85MRWIaKK6fIdZe8xr60eNPUYIqe
         ttSw==
X-Forwarded-Encrypted: i=1; AJvYcCVky+QZ+riQVPWppGfiBsySaS2Yg/smlx89llkbYxHXtqiUv+UYSiMh+Bo+BA8qn2oK+SY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUVqgGw8cW934+FEr4yMRsEe+KiZbx5azxUq411sBz/ikz9AbI
	DL0K3YHSyMzLethElpgA9GRBfNTjy06NujNSgu7/xv+xTmCR2FWIC/nhbWNDOyAaIy5tPIkFcqE
	uncqef0QhNVPaIGRi+Y8ynlxcBJyCSJZjgIAou6zBQwxRePKJnii/ONA=
X-Gm-Gg: ATEYQzy1SOCjwFc8JWDo8UZGUAh6atQYhCOHOFeWouRbuUF6qhYsy1gGjry28vCobcV
	E8lpB82OcsbDdL0DdojbRrDOGRdmhOAAU2ubDDce7tBpmbxsyJFbIzwTppYR3AqyE9w73Ccto89
	wMUm1ju3DWlav5rhb3BNFGMoa/KbnSyGC8CLlrI3fZ9OlZRCOi2Vgx6EP/hNOKe3Uzft60OOU+9
	QHgJC3M6JIJgNO69UOLWdjHgfPEoiM0nJEo36fmb7V/3TTUq9tDlzDDF/YuU9sEke6RhtOCMnqw
	1wK9UjZ/szK3iOiAyDoIj2LTgsiql52VhcH/nwQLL3d3QcOqlFBNHGFnYDy7/xS+XRygoN+D7x8
	YC1/Jmbo+6+7AlRKHn9F2GyE=
X-Received: by 2002:a17:903:1a28:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2ae0305eecamr13245695ad.9.1772088399990;
        Wed, 25 Feb 2026 22:46:39 -0800 (PST)
X-Received: by 2002:a17:903:1a28:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2ae0305eecamr13245475ad.9.1772088399484;
        Wed, 25 Feb 2026 22:46:39 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:8fe5:3076:521d:50c0:367d:1d7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5db596sm14382225ad.35.2026.02.25.22.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:46:39 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Trent Piepho <tpiepho@impinj.com>,
        Felix Gu <ustc.gu@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260124-pci_imx6-v2-1-acb8d5187683@gmail.com>
References: <20260124-pci_imx6-v2-1-acb8d5187683@gmail.com>
Subject: Re: [PATCH v2] PCI: imx6: Fix device node reference leak in
 imx_pcie_probe()
Message-Id: <177208839386.15535.2535030930377494480.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 12:16:33 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: D_wSmj_qDqf4CvNsplFCgUxTjEGqUlcj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1OCBTYWx0ZWRfX1OQ32N9Q3v0V
 zYcAwkfERvoH3f7rg9Vjyai/wTbXJdVDExefowzSyJVTKF51oBUQU2bdpx635igtEtjm1ofNRcc
 E2trbeownOfVK0+Cswk2uOblbyL3ydL3Rtdw+dALfUpzBqe5rGN7y3uM12Y0WZyi9fU1Ec6Vynw
 y70hOjsYOFozWnob4rOrs384Xatfzks5+ylSF84dY0C2Lun/a4Dv6vtlpycQZlveCMI8oQhvgWH
 xcljJKwBeNEzsa9mfkUc3haKjP/tnYnq8pEKWPxKAQLIrCvexjbkxwjq+CAiw5j9YxBqUmnXvcj
 IJ9eGFmRJsp6vU5DkqDLHEKNpWqN8x08UzB2oS2S6gLk1YObaWcwRwTvyNyhuihs2wMSw5uRhPL
 DpKbkyspF1sRMM7VqYZfN3IuwgmiPSECD0IhlSddsoDVt5vqeLiOVlx4GCvYK3IlA2+Kt5NVVpN
 tVmA5siWWiVvNmOH47A==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=699fec51 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=vwxMJ2_kboZHlRSlzigA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: D_wSmj_qDqf4CvNsplFCgUxTjEGqUlcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260058


On Sat, 24 Jan 2026 23:42:45 +0800, Felix Gu wrote:
> In imx_pcie_probe, np is obtained by of_parse_phandle() and must be
> released when it's no longer needed. However, it doesn't release the
> reference, which cuases a reference leak.
> Fix this by using the __free(device_node) cleanup handler to release the
> reference when it goes out of scope.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Fix device node reference leak in imx_pcie_probe()
      commit: 4836ad727486563370b213ef594d644d1bf85b8d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

