Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0B423140
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545064; cv=none; b=QxeChKhgRSohuOAnIB0uuXXxd56hfGOxoZFbF8MCQ066t67DZ1Y9zQNDJC9JxmPAixocGpaGtSOZoVkMkNGfoF0ZZ+Xph8ERCa7sUZcYl8Hu1OwS9G05l+sumJnUp3DCmalu/tdTxwa4cQzYVE2WrBTX2wWQWROU05Ggd4fe4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545064; c=relaxed/simple;
	bh=9Zcc9PB5heGh3bqpNEXEPdbmsyQdoCi/SiuNt0ko7zU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=stGJ+a713q/Bb/9U2Qgf3qFQuY9FaTsPKYL34UMKRSoZ9tPKHd/HwMM11Zz31iWcC307Gu97akB1RKr84A1DctM6GjpAJLj0VuOQ1L5idKBAQj2mJQozpR6bUR021OFnsJSzepjooz9ZpNjUq4SeYjXTPczVcjIVpNGdyatrPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBa/VAJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5zZWo1H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBa/VAJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5zZWo1H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9fWq334263
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 17:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6r224pc1M7FavILiplRKh/EJYto+mOVLIPyko1UisY=; b=PBa/VAJKDWUOVCJh
	SAvo7r2AaI20OYOCQ7eTqtY9mvLEFxSfMDJD7Z3vDyx+1pMoOmncEOiPnCHj2k3W
	NukrL5O2dkgG5oE/xLDVfAtwp2aYBhYO1vmyJti1+5/7XpAI4NFvlC0IQYp6BAt/
	K3skqdl9V6Wbq0HaXfEsAFsLan2xW93/LGIC7Z24w31nqwgJ2hYGABRG/xs+Q2kT
	62LoDxOSEC1QPY++z2QkBK62abEbU5MpcTO2cE6BCE9IcSU1iL0J1jrRzbZi0uvS
	coT/62eWrjLUQ6w8ydXqm6LDjZIIOOB3XASWyBqYcqVHK513h6nZ5SMHSQXfWCzH
	4goNQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527ysmf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 17:11:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b06c242a34so37141305ad.0
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774545059; x=1775149859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6r224pc1M7FavILiplRKh/EJYto+mOVLIPyko1UisY=;
        b=h5zZWo1HAw9cO+SfLQah+qs8S0aFTOQLBTkvCSUmpPR6x48htsuMKAFf1rEoGaxqPq
         vYeesXz3JwGoYv0FI6LJWisv4Spg+R7NSqTSQXWE8wXn5wALeKXmfv3eB8+x7LD8H2Go
         3NnbmY9ogrX2NqRD/Po6/DSUoICCd9gmXoABI/WTSb82WWrMsFomTyOL/+9t4rSXb0Ab
         Qg8ofONDtL/zpPxNiXud1Rd16NyZLGYNNNIwCdCfkOS4awJCRqrn/lTvkzcX5VKstdBm
         7FkGbms9Ti/KqPii9pUg2DRrDCupZzMPVU2ufFepZylbc9CLkmHG2EyRybzmi/nExdjp
         qi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545059; x=1775149859;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6r224pc1M7FavILiplRKh/EJYto+mOVLIPyko1UisY=;
        b=Pcm7JzF/YWvdR8+l11+3XNz0dkSFLhZuPMh+XA6vUbFniNH13VLf/PU6FHGujC9L0H
         XvvOv9bse4FW6d1o9hO/fEkkSAd7I4DH9OvaaU8t1gYFsvQONKeF/h+KQs0OQ+AsrYfi
         lAhIphoL8vGKfhIZ/xARzWOgt6cCR/+4IqVYCDfoK0THKXjhE5VjXx2UWqkqJKp2T6tv
         cv+92DtuGHAorguVp3kP9l7q1yZLNMFJQ9FKb5yynHa3DMVIMe22XVi8P6k2ySwVFqmo
         XyCi+Lexr0kTfTlkJv5iSzapSVd6QlTLBwt+pr8BHqQaewEw5pBhX641EfPOkRqItfaS
         eDrQ==
X-Gm-Message-State: AOJu0YxqrqDX/PCTb0AbRxLoAvqrYHTu3ZILVYPISH28ZjnX1yAS+OSg
	CWmeoM1XsREWfEfR+By+OBtE5oZ9eTNoRGri+oRdXJzxmkcXgERXwBjTwtbEkAAvhEZTsV9wv2+
	t/m4ODgpvF68IaG2+bwHaIrOGGnAM2bdaGAbJIOL6Yzx4TNjl79NCzk9J2jsbxFs=
X-Gm-Gg: ATEYQzyIZtwV98OIe7rVwBOws0uuayOSxhg7xltssbwTulvc7/G3N0J8+Gs44rm687l
	HurAkdMMyvbNOPZO6Vq47vMnkQOkmqGZAgnaHLqzwZAH9fpNvve+Q0BbFqRTQ+XpxJHTOQ98xDE
	sueY3582LcqpeMBaTuIPyds35nZiFvONCkCkeuo4MdNIaq09ZPEomJHvqcUc+iiGTDLT2Zg1UQe
	0rlcoty4wHKYKMmD2FgJr3RAmE2CADh9Yt2eNd0PytBXhUonTRB1Nq/Tu0gIczSaF+zQeu6hmf8
	/4AkEqqt26XqnYZ0dBaEPe/L7eoQz8CIxZAP9s8hOJMpn2CfuTV0w5x9rwOQ1Y0rwIGz5aVX7Wh
	orH4Foi5ySksiggI+URz1lAI=
X-Received: by 2002:a17:903:1b08:b0:2ae:567f:fd7f with SMTP id d9443c01a7336-2b0b0b5cb06mr95353835ad.53.1774545059060;
        Thu, 26 Mar 2026 10:10:59 -0700 (PDT)
X-Received: by 2002:a17:903:1b08:b0:2ae:567f:fd7f with SMTP id d9443c01a7336-2b0b0b5cb06mr95353615ad.53.1774545058539;
        Thu, 26 Mar 2026 10:10:58 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8c4bd3sm37507945ad.63.2026.03.26.10.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:10:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com,
        bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306021247.991976-1-sherry.sun@nxp.com>
References: <20260306021247.991976-1-sherry.sun@nxp.com>
Subject: Re: [PATCH V2] PCI: imx6: Change imx_pcie_deassert_core_reset() to
 return void
Message-Id: <177454505296.455880.9671929759521493742.b4-ty@b4>
Date: Thu, 26 Mar 2026 22:40:52 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c568a4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pYN8Ckv6pxGYxkbxldgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: RtH63dIShYLy-jwY3uc4Wfayo-GLss20
X-Proofpoint-GUID: RtH63dIShYLy-jwY3uc4Wfayo-GLss20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyMiBTYWx0ZWRfX3ZWifBAsdrdc
 qWyjLTSCXs974cYBTWHdsm81IwBd7OZRmL3w77Z8Y9cxOHbGihLOR6VKy6UYqrDu9cR+U8heN/s
 3jBwzbeJHiurA8zFoitY8+MkBrUQ1dP6XLDPI/0+ZeM7V9yI8HkUT9t4LWSxSfoaz5y+WLWoRLz
 l2GVNtf5Z0R7DXNanEp/Una/GGK3aevDolfR8iI0Rnn7YArmvCY+F8aOYy1V8S9HB6u2ID4ml2I
 kkZRefTX/P0x5+f8E2l3UvS0w6sIqnngEapuVamDgI6A2+i8p0ZKIOadG1Y8NHRp3e5jggcx7wO
 ea/l04OgnlrOQprXf43hk6ehy/d6ep8hxc2yv6fB0VRz6WbXLcR86IoARJ8+PSeSRMZeya8kM7B
 R41CzR+CaPSd71602hqrQE/CzMr0/OpNivKjUthT6bBVRN9lv1ThS5N6tL75Ep1lbfDnCDYuXBr
 /Jt8JyKe4ocysxzsuaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260122


On Fri, 06 Mar 2026 10:12:47 +0800, Sherry Sun wrote:
> The function imx_pcie_deassert_core_reset() always returns 0 and the
> return value is not used meaningfully by its callers.
> 
> Change the return type from int to void to simplify the code and
> remove unnecessary error handling paths. No functional change intended.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Change imx_pcie_deassert_core_reset() to return void
      commit: 192b8a1bf81c17852b6cf540c95b0a3bcc9c58c4

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

