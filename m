Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270D53BE635
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359347; cv=none; b=gbGpiW19VkdlYLwNVSSxLZDOewWR9HLGwkhienWmN0hHGUvPckN2nnuepvBekp5hQtKsrjqJuxa7tXQSIDIB/K7krgCkquwbML/q6txazTi2y724CdnZVRaZIYsLMYk9UIeDkqnb8vWAYPcRYOJqz5H9f4TA8pxP/9bjMsSJfMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359347; c=relaxed/simple;
	bh=fo5m4AkjKizHv6hKu7rjm3nm7ZDsLovNU+f7ayOVr0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxXh2mioZfckfCK0NvuVE/NtZxhSn+M3EGEk2cczfroJjCxeUavbedn84jV6fy4MkOn6Hl7S5L+pr7kGjxWc+6ZO36yzsAN64OfgY87yDtrhX/5OWLBuULeikVhlMhwAOF0/MiQ0S2SD8B4GaWD+Bp/GRk3Qh/ulc7dJcdeoqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgdRiibe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8ZLqJsm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgdRiibe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8ZLqJsm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AA07oT009808
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 10:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=; b=AgdRiiberGOg55TN
	bPt69zq6B8zegVZPLUoLLcCMzJ11uypxFljHA/ObNfcKDg12Duhm7J9DINSktu2W
	QoQIRENx/PSgRcfz3+pxdTRVYEcR+uS9FmAFaTcbrV12TIqTL9UoiZRst8CvpPXV
	bxT+MvmHJZ/voLcXoVboAxLUV9mL1ybQPKC4mW2l/DBC5W25ht++Z7dRhC7xxHgn
	Ao+t1DEZ5k7G8o8Vc6TE5Z4PZSVU63bF+U9WoR500KWpbVWFEKe03muGCEg9jhgt
	Kq3nNrkrBV7ufy08V4RDFUnxi9wZU/KokRbLiP1HqNrjrSRmU7SiF8W6itZamYun
	xJcfsw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycger6hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 10:55:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8efad04d884so31073786d6.0
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786359343; x=1786964143; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=;
        b=U8ZLqJsmt0bxVb4r+htos4mqf3bp0VNeTRHq2zRnWPFlg4Il836FrlLcefQNKm9N02
         pPCVM+Nz5RIcykL05kwRJT7/sFATaxMB5Iv+xiTCB0kpTtRjAS0E5ISJuQXjNLivUFzC
         CpCw7eSyjUHn6ZvoQOpXr53zJZliu3c5i320yQhZTM/Vw0Iq+NooQ3E91v2knpHgtsC9
         pZRYmHFsSuxSanzKfuY1AAkuUsPT8dgOjEV80nLWZbu97859Bhim8Us1UqyUUrNvuEZ+
         IzfO54gCaNCeCX2LswPi/qZztTQKARfR8wjReWLyRXI+EE5jYFvYUoR2d6VHSliLy1/W
         uHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359343; x=1786964143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=;
        b=rrI6Z/SygPbZB09h7jH57zmiQKOC5L/iuv8PW/CKlAIuzpO4+Tj+9yJohlBWzE9Rj8
         IY+AsJRqXbrqTR0mbKaq3ikBpnkjRHLQD+kweGLIP1ttijHZ7FeKup+7G5ezTqVmz7/J
         A148K26qZQ1OHWdi5OXb/vmhEfoJ/+CQWJibfkNeHyyPfy099B30nNH9DSMhbl4yy99v
         0gy8b1tYOODfb48cbarBmZ6CBWtrkBOkDcsQfUvCQ8Os7POhn6DQfioNbmPhbna5yGsU
         WFKD2fruJ6mc8PaTeU4YELq4ofIq56mJzYwMEajbJehod2NLBh/Ya+cbNH9YyvY/vvBN
         +fiQ==
X-Forwarded-Encrypted: i=1; AHgh+RopUl8OmpaxL9ef64uGOwTpKY2hZOIrBascP/zwAbFSCNk4dk4smF1q5p4TYAVFEJn/Vrs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVXNOREGznAeXMdHBOpHpDiyisGoqHAK9K+SsZQTVz7nlwFfiz
	LMEvkT06TjHYrFulcJprk+iHa/c33swRduM+ZHGGG30StPEbR6ceMh0fa0rnMZt+vtGNy2+4YHe
	rpbbo//UbsXQFVXgblULhcGz/OxdAHXCxkdoMPHoeawpoH103FVcaxRc=
X-Gm-Gg: AR+sD10r4vNXamcq+wHEII5/VspWjGbFOyJdNcnzfSQGgBEpdNv1UqgIp9F6sIK1Kbu
	OtiN6VIw0i03Llft2eJnsofZWD+97cwTvgFz0JXtNsJB5j4+qfc5vqIuzm3Xup47gkiozyjPh67
	zRndBUEoekHPzEAAPoYfLdWReB0rCOU8fhkIcj+pqxmUaoM6/VYPQwNt4tRLGSd7/JsgiP1YHG1
	Hvxn13Q8Z0mpJL3WDja6vryvtFI1+I38D9ELuv8hHmmD3m5PVkoH/71uEmsjIDMXnAWsuvzql75
	JkM7KJim4yS1x4/zgvC8GkA97tVGC4qEIXfmo2qKaKx2H97Gg2ZxeLlj36ARB3DkY/Hvq/dzXws
	zZCqtPERMOsRvXlqfaMVwo7ZAc4tp
X-Received: by 2002:a05:622a:17c4:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52d0b298380mr320953851cf.40.1786359343494;
        Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
X-Received: by 2002:a05:622a:17c4:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52d0b298380mr320953581cf.40.1786359343166;
        Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdbe02esm196322575e9.1.2026.08.10.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:55:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpio: Use IRQ trigger mask helpers
Date: Mon, 10 Aug 2026 12:55:39 +0200
Message-ID: <178635933666.24478.15558797954868182509.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
References: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mpR4yA8UrQLqV08JKOaRTfaxNVDwkHfY
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79ae2f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qRw7KHR_QVJorHy5iXwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: mpR4yA8UrQLqV08JKOaRTfaxNVDwkHfY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NSBTYWx0ZWRfX2Pd9K2/JlJeo
 PLScWJ8FbxZ5hHiybyvEjgwSFXRJTjE5OSgVOyHq9hiogZbeCsNsHg5/WJMGO+rda0fQt1nIaNr
 snTwPGp5K/Oh0JPTAZbn7OSK6cw48so=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NSBTYWx0ZWRfX5qjVF/b7mY9H
 TOC8XwYmmVv1Am1Wym7yVoKGZoXodjAfh8AvyAstkiEtPpEvzxtFc1teTw7bufZp3vPpMY2sbiy
 N2/DROqra4kNSm/vNXnne4f16kAHBqUJkwqFJJXMWNpkMqPHq3kGiSIJxM2lXBpuVyYhOxDKtJS
 MGIA7s/Y+jbM5Qx32ktVLQgFP+wN1Jw8O9cfYz3y5aHwcuMPZNK404frgz1jApYC03N9iqQRj7x
 5hUyX6VS6Uks69bdk43fG8VaOydryyz4Ao7KzHeLmoOu9Bvh8xjLlKc6KBByyp87cmaS7UM+RdZ
 cGS2TmbcuCzudFKnIsuY8mC/DCAt3dfHh3BwevY/Cxf/aQLfrQ6hcRTMJDgqDharRXTf3wAgvBQ
 v/UpY2cH3kJIAujAl4levRNjDzRpK7gmuavKyKFWPmzboXxaxNnWPnROC8qENJbSbg1DcxjlEZx
 uBvjs3T1RbwYRnEptag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100095


On Sun, 02 Aug 2026 19:40:35 +0530, Maulik Shah wrote:
> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
> 
> No functional change intended.
> 
> 

Applied, thanks!

[1/1] gpio: Use IRQ trigger mask helpers
      https://git.kernel.org/brgl/c/338c551bcd62ff4f97ff02359baf9d6f7f1f9fda

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
