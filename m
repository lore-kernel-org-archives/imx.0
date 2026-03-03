Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6A340DB9
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540979; cv=none; b=aQDqoDiMi3ZiNxiPZweyzn8D+kEr4w4MXZ4XPosHzLBBPHKLfDHEgs4fRaABqLIZEUFqWRFK2fCMY+u1wUbySMOD7Al/F0sxTlZvRPJICeJz4Kkhqbo0wIE+C/fYhPB1ob3oJw0q6HJaI1RDRtxHboX1yTZ3NuqkB7wWh64LWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540979; c=relaxed/simple;
	bh=ew9uwciLzf+70VcuN1RrFEQC2tUzp5KQFWMO6L9R5BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LoXAymiThebj2sPQ3g5SMQCeQWEoQ+CIpDrQFH9x0LgYYWdccJJBgdc2SjtFKZvFIPqNkIbAgZU8T/HBkUJrKi9HUoja2K35E1NDf+PktIz1ku80OXC9Bo31QaZUveVhhgy3gfW78PW2XfGwfKSFrEozczWIdk8Z8QWyhgKWxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lK2W9hql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqB3Cgg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lK2W9hql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqB3Cgg9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nHDK2630346
	for <imx@lists.linux.dev>; Tue, 3 Mar 2026 12:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=; b=lK2W9hqlq9NQpHKO
	j6+PqyxsfrTcNUVrmSY/G7pZ0R0VxkHi16XgNJ8z7HVEOS0UEnUyMj79ruuw1Nyr
	jKzO4sUgKF1vdtUE3K1g++/V4rIYesG+LrMjj5UrVXD4oT25YAgoIpbkp/i+P1nK
	O4+hmxmVCikWkzFLRucws+OGH9ZfjLblKT0Mu3gQERlqtylqCeIj6nqUriHdb/AW
	TxiEgAZre8s6ebCYXm4/WMYipDkqy0OFnNnyG6X2iTapPvqaDyEFtoGsfd0YMltd
	C9GEwhY+6ZkGqtGvtxOuDo5F+4Xi3e1R0LsaJA7+s2J/zaVLF7D0tqf35DXf78hR
	cvi3Hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5ashg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 03 Mar 2026 12:29:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso4329166085a.2
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 04:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772540976; x=1773145776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=;
        b=CqB3Cgg9jb9XPE8OJEmVuP3hbWqptXhd/HuSZtR9Oleq9VHlq5aUusgh3eH00xAOGG
         bvqjJnAHL5xR/yOafyxhkE874PbQHJ754Xssl/IU8+VEaTsk7RyISpXuweySHLR5ny0e
         aEq1cf57CZtpDzGl3bnhC2FvW4Rgfhj/rxbc+WBCakpTt3VgAizYAsU0NQMOBUKTJ1Dm
         AEOT59H51fHKuSw+4g9c67z2yPEFw1WFbOiXCBE8e5wfHjHUIBEvTCyWGnIm1CNaEN0s
         34wlBu66c85RJt/Pie7OOCpxIbB5RqI/jvLIg4LFFUjewcaXVqAq/YvtgxHYJ0ySlqHl
         fvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540976; x=1773145776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UFaVOOEMjvopJDZvAVmSn/0K5xprbHB0u9j+BhT9u8=;
        b=gJbcn821pxF1EIoAsjpyPnermf6+/WnbRxHEaQpABSosrF/EVFZvGA3czwHwUy5q1K
         cWy/Z9F8xRPlfeXOqds9Eq34Q2REMTTvyI7gOx0f9rXhDRE+HyvT/3OZ5D/OYYLfjYia
         XqHgUGoJMLbPQKqhuqIx+wZ/IOsO/MhouIDjzL7dsskAsirC/p7VHxDtFIZ4Bmnihthc
         tlgLdU25oN7VkNMRvFk+WwD3aoDSW/MACx3ySlqLB/7z6XPOcAdylJAevUdO6CIbQw7l
         MuN3jletZIPUVu4fL2XoHfjbA47ERSyvDwbe/xgfsmRCbGhV4lzb8PPtCGO6Up1wecEv
         KBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOe7KpVUhQHcWbwuxwz5BPwvdb66ia4QK3uUv2mVn6gffQu9nH8OCpCWENF0mRij9wQp0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5HhsntGYpljk0tMEEZYBVDwHCIm85PZzhdYsFMf89k9ajbvQI
	YJgbz/Gk5m7hwTTNCiQEZ3xaqm69j7+PdvXssVUX3fbIKSascuJqF/c20ooVlEio+oC3iNr69Vw
	5gV0B34QLQcTUwTEnsJNeF6svok4muVZxU+sZA9W0d77J7/ITSAnfmsA=
X-Gm-Gg: ATEYQzzgYmhSa+eSb/VWus8yBHlx6HFvtLFB+zTcWJBe/6cXzVTOTQMaAgbLuLQX0aT
	IWQ80LR6SWLT8n6A6Cd7oquYM2Pp2slg+bj4jaWtTGxzf6XrK/25Y8JqOKLB4DtWZRmFWzzsr4K
	vV/7LUr+MywpJVhl/BMMU00GW+tFBpum0eR4kE7l7Ktpx2C8fu3DWiyugp5wvZgTdo+gSMYpwrT
	eRvZLQZImGiAgX7Exwt8WvoYyOX+hfyX0qISD5GUQxO3GnmcPVh0xWYy2+D9W6WloaQ5fHrmB4n
	Nt7KKdgMXmi/AvLuGKu7sL6ostUkEkyGKzZrdDCjm4K1T1U2o8l+mr9eRLruu6NINlZyFQ/9efS
	yBCXgHO2iQngVybOne2YKUKgB2w+0mw==
X-Received: by 2002:a05:620a:444b:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cbc8d6f180mr1874331985a.10.1772540976321;
        Tue, 03 Mar 2026 04:29:36 -0800 (PST)
X-Received: by 2002:a05:620a:444b:b0:8cb:4d9b:6b4d with SMTP id af79cd13be357-8cbc8d6f180mr1874327885a.10.1772540975729;
        Tue, 03 Mar 2026 04:29:35 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750701sm498035965e9.11.2026.03.03.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:29:35 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related CHECK_DTBS warnings
Date: Tue,  3 Mar 2026 14:29:25 +0200
Message-ID: <177254093027.989057.8587839568838242001.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5NyBTYWx0ZWRfX2K9tC3b3iDke
 2sTV3rfGxVwWvne3lcSO271gWk0ltJCtusIeqNWwpjC/pGQ1mJAb/t6usbMpT9VI8C49iAhl+t7
 8FGA4iTCqrP2s/Kuh7m5lNvb41ErFShKAt8cAkIw3TCIZGlvCgJ6A120dne6ZvyRTyM/5ke6VUm
 QXc+RjT1zZAg3yYoSMhdWCUJvoc411c4iAmNXjEXfm5tgQy78NJu4fXuRNCiHXftfQBCemKm885
 Cx59bfPprNvgMqhossU3vNJdRO33KVN7xVhCFDBLnEFoT+tk+iUxhVl/LKKYQJyxNUo+432w5HL
 QnXx7x2YBqY3VP18lKCnD/4ygdHh6/Z/19GLPgpn0y28YEUEHWXZTGwpxLtO+q/9+I30jLF5opz
 8bcE6d6cuzLPa+0nD18hlDjFv1VxYxvOJefizy7y4WCjMLsZEZZISBmySWllwHoB6Zw6GAFIAj9
 5zIEL/pUIj18K+jfOSw==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6d431 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HS7iJHYFZOvZgwlv4tsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: EedlpXqiaGdcqOg2wSMMpeVsDShnjk6E
X-Proofpoint-ORIG-GUID: EedlpXqiaGdcqOg2wSMMpeVsDShnjk6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030097


On Wed, 21 Jan 2026 13:04:14 -0500, Frank Li wrote:
> cleanup imx6/7 CCM related CHECK_DTBS warnings
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad
      commit: 51ac0f4b6d5f4965153d8c39644ecfb228480396

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
