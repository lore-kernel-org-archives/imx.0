Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AEE43F8BF
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424316; cv=none; b=gqpltD5A7wZenNOlBy4j97ggcSJVLVh+jC+rvh3f2NftcMt2THMsAPsntZVfctqPooZop2pD9ZaKMfp5kx4LQQfyLdHTywgyynWx1RdmPGZq02zdaO0EJxGDI8Cu4ahYSWpNA4UOKhMaMv78Jf1siaAePC1v77V1Sb8QsDY9B/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424316; c=relaxed/simple;
	bh=CVmZHUrtX5gNkqgPakwu+EcTWZMZSOZjbS/aZTNVuzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l11DX21r76PvXxbPpVHYsidApCibGvRym0QgCizUcMYrKECgmw+V73gmXxHKObx02LHq+3plwQrH8IPgSJlpkOV2QC5rbp+tBToNfTECbdLIYwQkY12aBXleoWRmZdFunWbERQimYRNAV1lhqv3tBnCqhzXmiCPtKD4nxljoPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETammhEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgGLu5Ya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETammhEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgGLu5Ya"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEIoHE1252177
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 15:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=; b=ETammhEBJePEIOBL
	OGu567lRVLym81Q5efMqukA0jnvFfzBTX6004mtp/H9Toq8h4enIwwWCH+mq+dWZ
	8DEvTjQ7XC5PBR5Fs0M/Pi3mbW0r5w/adnD2Tjje/q/2gWIDXHaGlPsgUK/O9sgf
	LKVgv3aZ1AXk/+xrKhXiCsI7Qrh2bAOnVT/xjiK9ac+/L+gri8E/KWCOFMFzf0vD
	lM9riodiFf2BODrIpRK0qaukOuGUkbCQ1zBKejFQzCQjpfvHOz7N05+ll+Vn3r6N
	XaUEQyZk7xIpRdnSfap9OzGQSC9QODDiJYjx9y7LPYhSX1YJex+7B93h2pyJn5NV
	Dp0gaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891g9e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 15:11:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e97889ac8aso25504316d6.3
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 08:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424313; x=1786029113; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=;
        b=PgGLu5Ya/PbnNEK2UZEq84Ytz9RgOrXi3LQk9xjWavC0erSRX2PllzXIToWpfMlnOL
         nG1say05Fwc1tHOO7OmwAYvvDhy+8bgX9UEJjaOLxoaIxTEzDsa0+bUg2sIVV4qZ98zQ
         lXv5C+ZHAlKvBCVVZpKg1OIZXx4asEV9SYJaU3tP8sFinnDzQvuHjs0D64UpVSoNO2UT
         0APODwWx2uESpv16QGSqEoencRvAaZvi/uy0s2IqRrGK/sAbKBzdnH8iqFw8LMHhAhGi
         LNW5MUgkzWW9pxNX0zUzpkF8+MuUTopXwDMsZ0DCmyc/D7iQiz56F91QEpMgx2eZQcUU
         dT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424313; x=1786029113;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVfMOMYhkscSTMXsLtWPO+nq/qBcrjUfZ1YhNqAxROE=;
        b=B1RMxIqyrCEtHPqWmth+Q7WdpxYIWZi2nqF/gNuNeMLmHSqpfVUkM05sCIEG28RbTY
         iNnEZIVAFGDdOJ/961m5dCXkneWifM4jwMEHt/dbf6nULP4XsHjP5Z5MxmnLXxfbYMeH
         tWYvcl2XhXBvfoQ5QVxOrSzFM7KPPaahANE0oQtOxAZlD2gf2C4w2TLSePZisLWFqp3S
         mcDcGjGKeusjV/ejO4rIp7KF/7cacazxtPgt/sqHNPdrUCzLuchwvPxC3C8jwVLM2Xgh
         NOWlX1lVs9fowkExmEZjtelJkInnCD1fJB7SIsW8OgcD61emATNF1395vywjg+k6PYqp
         6wCw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy8jg9y+55voTE9FvOr/TRJhlKx34QwzGyN8qW5ix2jvEbl+JzHkQbVCndSsHMOpoEr8A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRgpFgpizbxHSvHkEADcLMcKSjhCL+lqb3XZ/3yDeYfixu2Ven
	6JdcPrIR/x9HDxaE0fXqavDs6W+3merMl91t462ggXzOvx+vL71E+G4Avky6O1f+HnAsM7nT7i6
	YzXsdUKpfprfkz8ASb6yRF96mrDJ5h1hXOEOomQSFD91DHloHqhXd7lU=
X-Gm-Gg: AR+sD11Dng+IDm3QJ1TRnyL7/Wb7esFGABVLqvN2lVXMCC+H0hA8ROl46IQpcLT24nx
	UUi+qauyTwrnJCL63OE1LIH+cvtfzQdNe5vucunuyofYf4yptgddBfgtjqdXkNB6xUO/JQrer3i
	wP0BGqAUSkGk6S6MyyRC8ySntZwXM+DtTXHjY171MA36W8FWjSFMOtJytcdi1DUW5ifZ6UwMOkr
	iG4gYyi4xyAMQTF4YrvDeVyjL8afxxd13lC3dBhuuq9lFuqi0mRUtdykGYc0WRT1GLbhtCHUchi
	5qq6X+cWOL/z/JDLtTyWFb3oUePVJd0au1/ykBkkkHQclkciZGgD49v8VrA9MZQm6ZJd1fTXBwR
	uCxIFTEQBHfZKGqX4u3pUT9SXV+M=
X-Received: by 2002:a05:622a:990:b0:51a:8c97:937c with SMTP id d75a77b69052e-52b386be0a3mr30861391cf.68.1785424313025;
        Thu, 30 Jul 2026 08:11:53 -0700 (PDT)
X-Received: by 2002:a05:622a:990:b0:51a:8c97:937c with SMTP id d75a77b69052e-52b386be0a3mr30860721cf.68.1785424312368;
        Thu, 30 Jul 2026 08:11:52 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f19bb3sm64581405e9.4.2026.07.30.08.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:11:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, bmasney@redhat.com, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95
Date: Thu, 30 Jul 2026 18:11:35 +0300
Message-ID: <178542193568.317194.16641853631837366761.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
References: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfXw6nI3xhvuGS5
 wdGnrXJRRElLSMSqFO4snkuHr6p4hLCAmgTHEeZxk4RfkA7JFm54nKNBoAhz8LTyohQtn9A1kH6
 EjIx/LuvQXGKMyp+m9v95GXhaHE86AWoC5w5nAymnDujAl2K10uhoo4sr29cl71PeIme9+CVPaT
 Z8kcgmMObnH6fMqFl9dRib9n/RRgKKhws2bSx2ljOVvlLsj4jJPci5wP3Ei7Z+YmYZ19mZZsrMh
 F9qhqeTuVKQHRs6UmMBTrjsK+nUBh2aoPDemTnqn93g8ic3iyQt9DBjqxAbPhLH4b3VmIA0Qykr
 u0QtK39y/UpyzWQnZTGvQFR20w3sxOHcA+fvsP0lfM35p1Y+DFwimxkTuF8nSmjGBQwQIULxV4Z
 47ceQGj37fMrnS6XmQ+Nby6JpTj81TH4o+btfmRqqX4ooP4sJOyQ/b4ryRwwWM6B5pBlXwfesfB
 SFI0u3Ak1amxTeeNRrA==
X-Proofpoint-ORIG-GUID: jVMgZYrRap45iaVY4_3rIAIGVRezFx0u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX5jbd14ezpVPj
 EzNX1Wqzx+VeskprSYDyHP0ZaZntB+4OPKDzTKVSvy2k09uru06zqoNRxKO8vBDKjgB4NtPLMjP
 CEOhAyd+ahOd0v/ab+PaVLXuEwViiP4=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b69ba cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=sMiTIix2QdjTHVfLxCsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: jVMgZYrRap45iaVY4_3rIAIGVRezFx0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300115


On Thu, 30 Jul 2026 17:04:47 +0800, hongxing.zhu@oss.nxp.com wrote:
> When the internal PLL is used as the PCIe reference clock source on i.MX95,
> a REFCLK rise-fall time mismatch is observed during PCIe Gen1 compliance
> testing with the Lfast IO analyzer.
> 
> Fix this issue by configuring the IREF_TX field to 0xF (15), which adjusts
> the transmitter current reference to meet the PCIe specification timing
> requirements.
> 
> [...]

Applied, thanks!

[1/1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95
      commit: 39ec460b56b26319d1f31b459e8be7ea34ae9c67

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
