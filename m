Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D3433291B
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493319; cv=none; b=p5qy35B5ATgJnStrUMVUtozxxVw9X2f430z+4CnYHI0IZhtKvNxFx180OmsMMSPysrIaSM9TNfjr1sXQhUhDENbDSw07ENmYWRFbtjv/luS0tTg6NbNBXJavuBd/M8bNeIbqYzM3wqb3/bAPuuL15Tpw3mBkI9ThR6AcGfSBVBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493319; c=relaxed/simple;
	bh=XObOU1tEztAAXwr8c6+N4w3p3kx/Ap5jdnHQitH8gHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ENZBmWROpNSNhTnglJ+UlRPvVwnSguw1+zEsklkTIRdLF/bdArV6J++/vqgT4rKBRTnUplvr/MPP3jQocQYNrJ07rpaNxey7ZvOtjsGvCEkVv1onhJLqzEm0jOlh7vJg8RbjWnXGYwg7UFsbD+JxJateXlz7JOwAIpkOvh72Ck0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAgLW6ix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cv+lO7Zh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAgLW6ix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cv+lO7Zh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBRIiv700902
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 12:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3besvCe3+rw8IwX8njwzUQkyMTKwMEQbkR6vw3/xUlI=; b=cAgLW6ixYruoNWrd
	ibsU+dchJ5vfjdDxoL8JD2QmijCzl5+E04VKEScXa2c9EOwpahruDRSoIVjyvB2n
	OgVtZRydnEIY1D3letMEuXQi3tBvwA2mJU48I3/Htwp9nif/Dkm/aEb1E0ZkvX+s
	zkwjSkKYlZFmTOnenI88XMXNMVOQO0Av2lvclDrHwOK4VE8ucyUmC/EpVY3WBfKm
	3eg++2CfsYHIUOcpmULsU6XtN9OpO7pdIG8JlEynjpg6OPbMk0PwbVV+s/zE2l8q
	FxJKEo7byvQEWeds+FiPVReTGJHOGJYMhc6lkztRADRiTozkaXpD6qut2gkR0xLh
	+GpX0g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jr67a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 12:35:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a13cd9a784so52770545ad.2
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 04:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766493316; x=1767098116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3besvCe3+rw8IwX8njwzUQkyMTKwMEQbkR6vw3/xUlI=;
        b=Cv+lO7ZhMy6UGf2VMJFtPCdXRKqmkzrasBvf6Cugb+ogu2fMZ7p+u+lYCEfG7IG5Gq
         Xn9xfMyfV3KJDjV2+LtLn3FBxNlGlZ1jC/Rs49naZWKZmhe4K8ati6y1cUihZfnaiESE
         tDrYQM6QtXp1Yy2jYoMzRmxovzdP2rWsRHNdA2KhLr1ANuJvCo+Aneu7xna8bbv1/ZHB
         TJv3SpWZJFQ6mGV/IM5kqJHO4Gddbhr2vX0l8TIhLlbedYtsfrei2MGs7pin0w3sb/M5
         JxAMW1KTYdeMz4TXKsYsyxgMzBYADSmu7Mjlo2q+YTTCdbSxbhC/orcjIZL7O48yE565
         peKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493316; x=1767098116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3besvCe3+rw8IwX8njwzUQkyMTKwMEQbkR6vw3/xUlI=;
        b=NU24+wKYVxiFrGofVpx1Nzv/hCZx2symGrzqZ72pE+L2rsr7e8uk1b/apKUnkSlCBK
         Pijukr4kxRCOWeyN+kQNScNSJy3K/aLGMZHBjMdWL9pAXVcy6oP7djbhr5kkascbKt7b
         PtPZOYdRYQkXAJs38wTfdlD9EYzzjEOotauAf3Nt19Ee+fQxx8IRGk7AsACkiQgqSU3P
         DZkQnyVlpZvvH16DZrHlYoLYMgOB/FXcHw40zL+sRJ1nlnhkXCvpz7udQFblRdB62CVu
         /iGit/8dolezuIFKYrPPjAMfdFdSmSaqAUBU9k94bwwqYWBZ66WGcuSN0Iu5fmbIGN8x
         UBOA==
X-Forwarded-Encrypted: i=1; AJvYcCW5EoR6yEkUmkpR3qblsrbOVhebB03TqTp+68vcUeK7byb7l4W0DbDiW7b3NAjefAcjwLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2fF2e8k9lDa85uV25z4eIv3/MFGi5M/tMRZOQtP1Bcw3OkQod
	gA+CVGkSzaCrz6yto9e6Ac47L0v4O948GYzrEbRciSmkKCRey+7jNiSNQvanUu5AjRQwKLaMBn/
	ABvmMGQaVqTpgnO4DZfqkubPiD+a7m7k1EsfDl2HckLoB+E4C0lgxv5DWTloULTc=
X-Gm-Gg: AY/fxX4YlnEk9+HIBuUzMDV2Ljs4QQ9Bg2MA5ErdHH/dELT8Y3QPfsbbpgDVqoV25Y7
	/+O4si3V430rKczga5hkpX5Clc5qgRlLMqjw5hW6ICwkiz5wNB5ufvZFhzcCyiyBtlu9IBge71F
	gRUm6hhzz7xJG2kPsqll7S39aFdqihcZ5TeqY9O/5MjrRNuDBTOMWJ9FonepKD+RxZQM6iRj4kA
	nMJ1UNC9s2uEjdk5VD7mS+F6NMWfskgKCom+KOOkodwZis+tPs2JStJWor5uyYrqppXbd0HBEzV
	ONWkveI5TaFQT8+YByhSCas5Z9VjeCyZXeQNWCnTOUH/NH9pun+2QymicV5XZwtLSbPe8hhltJI
	L6basQJjX
X-Received: by 2002:a17:903:2a85:b0:2a0:c1f5:c695 with SMTP id d9443c01a7336-2a2f2223709mr154383895ad.16.1766493315929;
        Tue, 23 Dec 2025 04:35:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK/WfPK7ehic7AykZDkqMohCsuORpQskp+MgJ/qxEP+NjSVB3+4rmjRKLgNtSu8ssfUpESfg==
X-Received: by 2002:a17:903:2a85:b0:2a0:c1f5:c695 with SMTP id d9443c01a7336-2a2f2223709mr154383625ad.16.1766493315435;
        Tue, 23 Dec 2025 04:35:15 -0800 (PST)
Received: from [192.168.1.102] ([120.60.139.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm128637585ad.60.2025.12.23.04.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:35:15 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251211064821.2707001-1-hongxing.zhu@nxp.com>
References: <20251211064821.2707001-1-hongxing.zhu@nxp.com>
Subject: Re: (subset) [PATCH v10 0/4] PCI: imx6: Add external reference
 clock mode support
Message-Id: <176649331066.523506.9443864112044699350.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 18:05:10 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMiBTYWx0ZWRfXwjf3LsefUDKy
 855gQnMXxwFiEBT4irKBu9zpt3YmmjIOZRROGRg7kh+asPr4yMcOiAa7msOMNl2pEh2zvT/q2Dk
 EUa3YPc0A5V0feF6/7sf8wrHkkX600sOyDbrWWg+iRA9k1AeZoSHen0cJE9Ze+6khRz5SdrnetC
 waU7gPQKjo5UyVyeTgnLzGS16+y5QgvP6RQkUOBtgpBrqyvY+e4Qk85ga+DBUEwS7fkK/50GOyO
 tX+RG3T7OIOL3kHYK4eXtcfGdQclNrAA21Kt/g902kzJ7uUHvMgbN3Zt2+q3Gxx/qGjgHobjTYM
 w4tZgKfo5f81vvEtvsqivBA3hHbykmv6xU4A9iwMn4ReFT3nApO2Ad2TzgkEEsFzktsk9J7XdXl
 L6/KXJPD9sP6l8GdpfQ6ahMzOM8nzDZVGy8qlhxEug2SIsCumq2f10U0/AtQvjm4r8LELnFVI83
 9aUWpchkcMvUT6tz+kg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694a8c85 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=wbxd9xFQoh2bOL7BUxlcyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EXx6v-oOm7wFthy7ysMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: b850YFH2Evodxogb75w_97UA4yPvN_Sm
X-Proofpoint-ORIG-GUID: b850YFH2Evodxogb75w_97UA4yPvN_Sm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230102


On Thu, 11 Dec 2025 14:48:17 +0800, Richard Zhu wrote:
> I'm really sorry to send this version patch-set late, because that I was
> engaged in other emergent tasks in the past weeks. And didn't have time
> to continue this topic. Now, I have chance to continue doing this again.
> Sorry to bring the inconvenience to the patch review.
> 
> i.MX95 PCIes have two reference clock inputs: one from internal PLL.
> It's wired inside chip and present as "ref" clock. It's not an optional
> clock. The other from off chip crystal oscillator. The "extref" clock
> refers to a reference clock from an external crystal oscillator through
> the CLKIN_N/P pair PADs. It is an optional clock, relied on the board
> design.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: PCI: dwc: Add external reference clock input
      commit: 418970983059aa06302ddd5ca76d441973b537c1
[2/4] dt-bindings: PCI: pci-imx6: Add external reference clock input
      commit: 1352f58d7c8dfb6ba0fbd2041bfc8b4b3966ec67
[3/4] PCI: imx6: Add external reference clock input mode support
      commit: d8574ce57d760a958623c8f6bc3c55b5187a7bd7

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

