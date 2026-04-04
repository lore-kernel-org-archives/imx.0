Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CED24293C
	for <imx@lists.linux.dev>; Sat,  4 Apr 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775322024; cv=none; b=Cq4ndRDcAevAPYUOGeeNoceqqVDPfrAugEWR88PfzHbbxTRV38kIapnJ6YbfVUAYRbPBFy51MLirH3/7z948635nmWVmLNStnmFzKOKQuv/zQX8v6HfLxLG2LNFecBb2w8TrcIGdgVZtPaKTCIsfD8g01G82Kol56tEwoVlLcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775322024; c=relaxed/simple;
	bh=gjCBGAGP81EOH2oljnu2NmddwK9MeX+IixvluhZ/qRk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AnWjVyF+oGeh2W5MsUp+ppsGDl+XLlRDWRWLKKecq6Pl4GHG1BkJDcahG8QLM4JpaRGJYT9gC4sQitVDYbhgB46VkqkgQXqCZPJX+PoVI/xbG7GoQ8AmyLwwdzcBnurt0MRbQ5UzRH427VIeWm5VMnrIhZp3Hi4wBc9BDKBfmng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pH6exHM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9xvxHTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pH6exHM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9xvxHTU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344lfE6919311
	for <imx@lists.linux.dev>; Sat, 4 Apr 2026 17:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHYoMiuT+hFy3l8CYUd8tWmBQMWoLPghXx653KocS/A=; b=pH6exHM40Mb/jWHv
	EoF7X2tC/uk6AA9v7E9Q/VuVuKiLEkYBvoRmtkc1E+RiedArGBAhQ9IbgkB5fT1N
	rOnUeRcbJSgBNTRFneYmWNKzG0iykmLfa1NqQxZcC19ab+1ZzhkX8kTpOu2Vbbc+
	zf0FSZ+UOlAbmmEI4KtUQ4ZHbIaWMn8rl9EDflmN1FQV77v0iJCkokF2KcPO3UCe
	HM/JmqM4gEMyWre32+vTQVWNA82Dkjngur1J+STLBCllNnPIpXOBDFvNwOOwfxJp
	Y5IXnWteBbyUqmwvuFWeOo0epAbyzj5unJqzRoNWxYgKY52trakJgqP3bTDjSdUc
	vOVEEA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux89358-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Apr 2026 17:00:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c70d1f56eso1556243b3a.0
        for <imx@lists.linux.dev>; Sat, 04 Apr 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775322022; x=1775926822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHYoMiuT+hFy3l8CYUd8tWmBQMWoLPghXx653KocS/A=;
        b=c9xvxHTUbLiL/91HVuhJ0dT2W+KNavEtooE+wOniuszELMdJzukoxAKOMnWE3x6MB3
         ybfQUTHtcEO0gBRre8pIOb4cnI4tYznCgURO0Hw/PtOxotNEWIVI4XSxTbHjsYwVWxVB
         6r4xN3IyQt4lJlcRMLNC/cNvIvhUC3PTKtvFvsLhHKskt8xHvV7RwfUfdi+PVq2bcoyE
         X5IscgluiwAnY4wIEkLO8fEnWllIr+Cr4Wczn1uAjL/q6NEYUqWHqdpHAvup1KbUqE+w
         MsdWoVyhAqVNZ2DYVoO6BKlKworo1bl9By0Shday2fW2b5NAwT/65Firb5izzfkSqq9i
         dIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775322022; x=1775926822;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BHYoMiuT+hFy3l8CYUd8tWmBQMWoLPghXx653KocS/A=;
        b=Jv9/jx7VTXcqIO60r+Tcir/AQIR5fLHC3LlfSy5EQ2whytbS2PnSOMwY29hmIYljX/
         zCrhw+Aa9qhk5frFMvbh2Q0+ZvzJbQKhhj+/7yUjQ7/OrSFifH4JhxLyn8uQ6/z1/gYd
         jwsWwV3pnVMKdMHgcouMYiN2EOMYnJGEzELUThHLQ49I3LLk2QLXMALuqElYOkE9QxJa
         aEWXwvNEMqYbc6gz4xLQEq6/0iQh/GZeBCuEcYqygF2ZZhlQtJfVAqdW215OHIsXAGeS
         va26hKSb3lJ9tOSBLNgOd/LY02niFxeUWAs1HyZ3XFuKlGldFYPBm3rt28zR0kmGeLBh
         tcYg==
X-Forwarded-Encrypted: i=1; AJvYcCVTJz/yYoVn2/YVf0rkp6nSeB9U3in8Wt2bSnuMU1jSF8mQe0kQFmoiMQYs8FXIPQ57usM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA+15/d9hmlYUoXU7VhvVIDsxhW4lt4GdUYjbosqsSo/zYJpld
	Sz1t4KRcEY9sLVe+kNJqg6AHyM4ds9j0bNOeUcBOmyEPzUunaS0dJ/hZeQfgdxEV7MXc7t0KzyS
	tTGRRpUukdEsAHJBSXmUrTd0ZjLN4T+Ka4W4EyDeAgjCWJurzXw6Pupk=
X-Gm-Gg: AeBDietCrKWctgenfbC6IORwbqe7LX2CNoxYSZSB5sAzSWsMSbdcHIdMEQXzsupq7RJ
	psBuQVzQ5rZBbAMkr8kh/WFAmi0PKSN8orWsV1YQKCCPAW76APGSDffI09iwbf4g0MDGhuSZJ+a
	27M+0jb0DEHHcv1LLRS8wzNiqmpEvwMDFHQq0YyjW6FMHoOXIxgT/R7bv3gyP1GjuVRB3fhZeyy
	oATePcKwICnD2QnA7rbTjJuhQywIbXIn7IdqxgziIQPchNXfcT6K877FNuO8gdNIjqXNAYZj97l
	R4BM6wuXlG8dzFBNB+HbvkY+JPyFIgv8z29BtYL3SXUwUa7DQw/sK2/BxO10NRml9uz9gQbOYxB
	41t3sxdYu9grEtZ7k7bQOm0HI
X-Received: by 2002:a05:6a00:a0b:b0:827:2c79:fa84 with SMTP id d2e1a72fcca58-82d0da45d27mr6277605b3a.12.1775322021805;
        Sat, 04 Apr 2026 10:00:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0b:b0:827:2c79:fa84 with SMTP id d2e1a72fcca58-82d0da45d27mr6277559b3a.12.1775322021206;
        Sat, 04 Apr 2026 10:00:21 -0700 (PDT)
Received: from [192.168.31.133] ([2409:4091:a0f4:6806:b530:cb:a537:434d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm9368133b3a.29.2026.04.04.10.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 10:00:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Franz Schnyder <fra.schnyder@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        stable@vger.kernel.org
In-Reply-To: <20260325093118.684142-1-fra.schnyder@gmail.com>
References: <20260325093118.684142-1-fra.schnyder@gmail.com>
Subject: Re: [PATCH v1] PCI: imx6: Fix reference clock source selection
Message-Id: <177532201484.28194.6879238704665681982.b4-ty@b4>
Date: Sat, 04 Apr 2026 22:30:14 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: iaXssFO40FArWpDYY1JhEJNGrrxihOui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE2MSBTYWx0ZWRfX2+KJl8roIsks
 xXV1312mhuvVlfk2AoUde/svDDZt50H0F1ETWWloCcJvLyS1yHl33e5BnUYg9mUZeVuAG5FBKpp
 kKyu3nv22wVzu7P8zzJgBely0gew633un3rwPaUKPKbLaeEprjdQN3kgO4ekvhJZtNajM93zDky
 rTJNW3spNbRzCjnmnkpZDd5wybWqstM60mSNS9tnx+4apQXt8/v7JFrByQs30jbRhwachdLVkA3
 Bnj5UcSbKk/e3xEkXIC+xa2JblwroB+O1zT1lyYOQLzRirED7OdfVO6VeEiKXquxm5p9iFHHbng
 52M80ZwgP5Hs2W7TOedKQsCOi2KZVQkYgkz95/3FALJq6DVRLn6pAEm83U9Ow3+p0zgUhUnGIrs
 P6Zl2VLRxapY2pGRs8zxOMhU0Rd9fJhoTtwaFW3SsBo8CCdcBvypyIF+yOmb7fFyiAvCeC4D5ia
 W+li4xymvdvbKYWgadQ==
X-Proofpoint-GUID: iaXssFO40FArWpDYY1JhEJNGrrxihOui
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d143a6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=d2OGGJ5TCE6yqAnRVzwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040161


On Wed, 25 Mar 2026 10:31:16 +0100, Franz Schnyder wrote:
> In the PCIe PHY init for the iMX95, the reference clock source selection
> uses a conditional instead of always passing the mask. This currently
> breaks functionality if the internal refclk is used.
> 
> Pass always IMX95_PCIE_REF_USE_PAD as the mask and clear the bit if
> external refclk is not used.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Fix reference clock source selection
      commit: 575d7268ca07fcb1d1a50399e1399ba60df3cb27

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

