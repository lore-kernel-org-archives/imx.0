Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FCF392807
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 09:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996599; cv=none; b=lNSA4mqRtFqHQsQrsQHaj2iZA3Bdi3LVYQfIvWrq1+vIRbQeufhUrMsRBA9iqTo6/zo9VIgtuZrGSBNByVOwn6KkGAglhsKwP83hXU1iuG4n9fTLM3qadlPnQUza1hxTDwK/Gps7xxReEf9Xw7LlMhBFDrwHGMBi+yPrNm63IQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996599; c=relaxed/simple;
	bh=isX958zSg2weCUOrt880uhtGmT7uXK/ufEmrKrSlE7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xa1WVNCgy0a1SpJqBTRPZqkh/mab/F4vB6SvJS6qqXUDYAdfdDqoo3PuQlPDDzGL7Di+GreB7aL0CUEC42BNubILuJNvV2QQ9OR9dJviGiKj5w7KKAUuQts5MOxuNGBXKtJgPR5D4W7Rdat7rkn+M/9mfmunex84czHC54ODHoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsycXEnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRixXim3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsycXEnY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRixXim3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985SpT006861
	for <imx@lists.linux.dev>; Tue, 9 Jun 2026 09:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=; b=gsycXEnY+gGlSHSG
	44GbfRCLFUTs8Ocv60TdGtX3LrCLh+W/978alP4D99a6prBr3mL6rPPyg2Bw6i9i
	z+vvAMkG14gJngkEHj4fo3Yn8868hIZz+FNeRic4WI2Wz3oLDOjcSdhx+sbjfyMs
	nq6MdWrZbolfNuJQHUyyLG5BmHYcB301th6HVeBwUCgxxhBcmoHfBnbcgJE8lqD9
	+xg306g+ZLnRqcKsQHTyZIXyZ7Ji1c16RncXanlCBO3M3KmGcGHBPEranIZQd+3I
	PELwtSoV0mfaL6x08GWhmNMvjtj2Tqx90T2/sz5jLC1B2/xraNOT3GdstAD253LU
	sBYh3A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr9mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 09 Jun 2026 09:16:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175bf22b1bso75867521cf.3
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996595; x=1781601395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=;
        b=aRixXim31TNl32pFk9J6S/IsioRYLuZQOVirpndqbAz2gY1gCw+AXdwqY3BUPTpzVr
         SKj9sw6vosps/TJV01d3jznI5GPL1DmzBGfGypl8qHEp8Nsslqy6iGc6OUfCUAOMUZXM
         3X7jWTikyNYKj/t21p0mvd12XobCvz+QP9/RKEPA8y7dBzhPZwWrHzkxscgCwj/Cy7aE
         Jf4HVZuu7yGeyd6CHbw0DpI5gNJEZO7fcV0eJlMHg3v3hNSWrZkJ7y5YD9IL8J2qiL1k
         xzy1+3ATcfWqiAcN3HmxYPjU3Wx1PR+ytFNLQp6rpyUH5gijXS0cq6VbsV//KAAW1YvA
         xMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996595; x=1781601395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=;
        b=f/6B3IPpa+/5M+2L978G8AI+CIDmsbnYZK3+M4VRb//RaE084FTgrguUbL6aPsHGdx
         ImFheM6IZWxGj+DqxJg5VX3Vd5Dl+hQifUKYtIqE3M9Fb06qFkcglF+/osYYZtX3H1AO
         Mez+7LnvxaqyYNFbdQWeMQvwjEJIyO48Sza6CTo9zIG/YEm5yyKFpya3jPg5EKZF7WKa
         WZVKlARyZyvzEKAS+DJo8Ewn5YPEMTTO/yVSQQCG5HCKDNF+th+ZwE8rytVSk8f96d9S
         9oCECNLc+Srmjm9Ux5Qs3jftNRdZ6fcLFNPg9syF3maeszBcmOBUW2GBLT/5e2eM1EKv
         mgWw==
X-Forwarded-Encrypted: i=1; AFNElJ+FgFQk7GpFH3xvg0hLsz5biQZvDPhue7EaXAfXgJWeN8sGiL35BheJBOxwfXqkHNk2Jig=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDGcld8DxuizWC0naRb8yHsEErkoTby8HW6N6HOlQVXRaRcEB2
	nx2uPz80XAoguRdjEjd9BQTk1fmrhdk9yRw2MpP86bgkAxj9UMDj4DLH9G8DTh4/nAd8C/b59U4
	6FvTURWbqJD785VYaM29Jo1JY9ezVRqKwvItiqk5cMB/bWsuTYDXbgtc=
X-Gm-Gg: Acq92OE3QB1lXt46Rgmxi0b94g5Ywafp0cLoZ9hkKetumjaUVJz+FHhnT3osm8Qo/Kr
	Tkx4wzD49jovpan5KLRLb+a+L98dyRiXbL+lKmW8zNUbXW68AoHppIzg4IvmYjEF6TCK98ossss
	SgQ+KpSMG8MK5jB/cJrRlQBiB0M823A/FX7+QrUwvLo3tV6ntf3xvN8VBJpuXi/cU0hbG4WjDVX
	P2NgBOBPqdEnoE8+7MbQNgBPV5MoC7Qh2CMNFshEcT+QO6AIBm4oTmAeUkHj410HX01QvARUZiG
	vkymNzzRHQ0XgpdincTUOb7T/6HrDI8c6dO07UlXC3pc2tUUh4mxIYXWrAfFjNHwFbGmTwv+/CC
	KWTKwRgYnH21wH6rN6+KULTcfcvIRNDewWP/EppVPI5H4xYBB7YtT7qM=
X-Received: by 2002:a05:622a:6096:b0:517:7217:6737 with SMTP id d75a77b69052e-51795afe9e0mr272600211cf.33.1780996595050;
        Tue, 09 Jun 2026 02:16:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:517:7217:6737 with SMTP id d75a77b69052e-51795afe9e0mr272599901cf.33.1780996594578;
        Tue, 09 Jun 2026 02:16:34 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm60912430f8f.9.2026.06.09.02.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:16:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Date: Tue,  9 Jun 2026 12:16:18 +0300
Message-ID: <178099655221.2098924.12939836605538533758.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX1SwsSjuDwf5b
 lYVkzemvT5KY+3IGpeq8jvquteSvS2BODXjySdVh1Al4x/qGEuNE4roHZTCrzdV3Wofk2qB8VyO
 rFiQPfJg7RW6winqWGTrX+5r+ONf404u6YqRlOXQEJ8FpoNja24JnzwiKoCjtD9luD4yQtu/PUo
 PbhV+iim/LA1MSXck04e3rSVTCSMW37Qp+sqKTXuc/ArsDsULmOn/16C1+9ftK82s0sUH7Xsgjx
 lbeulfzqDM7doKB87JDFy9RmZS0IvBeispY3VEALA+44zOug+O2ZHmeofIbvSz8NmIN7uZMk3WC
 r012hbXGUHrYbY9bE656xn0W7qDpli38+x6YdS7LXodI94Y8P6/U5wJQPdwUjM6D38bNP2cLK37
 PYzyYfeenYJVHtpWO0y0XQMV59YTvSxPVBTOZam/vzCQNlxfxZvfaTnFBFiXd/gr879/q83YiAk
 FkazqsF5nAOdgZm0qhA==
X-Proofpoint-ORIG-GUID: m2GdH9FMFGeejgZ18p5ykWMAoUkfmLZR
X-Proofpoint-GUID: m2GdH9FMFGeejgZ18p5ykWMAoUkfmLZR
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27d9f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1NP200KD9VQfxfjUtC4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090085


On Thu, 04 Jun 2026 21:48:01 +0800, Jacky Bai wrote:
> Add debugfs support for runtime tuning of the audio PLL K divider,
> which enables fine-grained frequency adjustments for audio PLL.
> This is used for:
>   - Audio clock calibration and testing
>   - Debugging audio synchronization issues
> 
> Two debug interfaces are exported to userspace:
>   - delta_k: It is used to adjust the K divider in PLL based on small
>     steps
>   - pll_parameter: It is used for get PLL's current M-divider,
>     P-divider, S-divider & K-divider setting in PLL register
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Add audio PLL debugfs for K-divider control
      commit: b3dcc8c608fbb6352bd94932ba935f2078c9090d

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
