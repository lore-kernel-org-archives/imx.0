Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706837;
	b=naLK/gqFRkhUGMlV+0QjAvv/k7eNycZcWKgbBmjWb3Roxr4Q6chixa6vScAqY9065Pp0
	 FPxRgHNTHxdtt8FL7EXFgT0a0skdLPz3HSKtUIwe6AxwLGGzR+0lbz+a5mqmUGVvqh5pd
	 BvSBtdjGAb/6HlLBE0JvV6tpQoapMHWkr2Wxqn37MJk1XZBFUHeZdzLiU4l+56kam9v0o
	 c64vBvij1956NMmvkcFZxIUZUoRR673dEj+mUrjzKksFe+iPRiLMLRTNoAvb5Jn21pMet
	 08c2AID5UZucWJdBxcC7wOALgX0ER9u0zWrs7WXlFTRRVNwwI2wtEAkyfy8yE7BuKjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
	b=ETP04Ck+FJuwQFnr1X6FGAyC4zGRHSgAec3J9aubGG8fvb76JMbbICy8vYhg1tSYIago
	 b7rkSqEABpqtxsOFWXqKOKDqz6UBXh2yeE75pFC7NAiTYrNAbmuoI8zcMzT8u8DYmyu5N
	 yLpvym48C8h63ARz0oyKILkeoNO3r3fayrKRI2S9yslsfn0JKSXHGREHgZp2Z6EfcBvg7
	 IIvdR/aVe7OcuhfmW7ugc5Vy8YGkB3gNZmZoVHRCxO1qAoVWfyBqAgboYGqRBrGIwjMjB
	 /I2XY2W7eD1s1wuZJYY0wLReqxz61yv5bOBlu43pNdgcnesP+nvk12JgewPWnGJ/+7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjbEXUjL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F1E606D81E
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 11:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F1E606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjbEXUjL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAF4C2522013
	for <imx@lists.linux.dev>; Tue, 3 Nov 2026 11:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=; b=MWWjy+ZVi2QdM7hV
	mqTyO4PsXxS1DeaTU7F0pAhk8eTinZvdhnDH3UY2nWUpcmotKOOoNSkfFYno6zvP
	REV6ABDEPV1Mi6FxJu8o8aHXxbGZ4bqB5mDrgZsk6oUaMDz/uw8uPELXjz6h/pe9
	XHsfsSXDnizijPjlIkO1rH/9HbhyfxvkHInASLwANmxINNEuUt1A8Iq3uXhv8gzD
	jtrLtrSdpmgIjQyTpzH4p2jGLgzKVv405S9fxEOkSFBSK17afQ5ypntnmcE+zZde
	OxDAZWtoPjUvNfQ/RumMUqU3vTm1o3B2J1r3WtcAYbHiubHCK8T8v5pdvCyKmcS2
	dVepVA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jghw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 03 Nov 2026 11:53:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60a365440so2563409a12.2
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 03:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706835; x=1794311635; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=jjbEXUjL1is5FQDKVlzuOSnvK2q38HncBLyffjC9UL8X/f8soOwB+SfJaScq92bo5U
         S3xPr9HwyFh8Aztrv7lSHirjEnckLrRlMP8ZejFm9ES9cnerBrikSzj3qBRZKhvBWp1A
         0B9Df7EP9yzn3oC02ovs05GlIZTe2cf00BjGcNyfZpnG41gTGylTClJhrCn5dP0/VJ/a
         q1W9CnP0ROI9I441a3+CErUlFlSMIhKItuW/dikg+PaFpOmXX6fbhq8LlrJ/tuZp+bUz
         fvlD/uSR8tCZAu8smLwdENGeNm3JkvLugMuiJTuXTyUgWYnZAbzNd5ABxGU/eqgLFK1E
         wd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706835; x=1794311635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=zupLj6ZPgj9ATIhNnueuviRm3DQiwEfhJJY/edv889RNo99QIEiKCnFqSxSTtP0zug
         dmloXn83JvRSnball7HSxOHSSqelKjSgqTRMD5e2kYiylKyztfk0Mmd3RXeIkaYRa86c
         P9ublIjuBMzCMnHHvY7fYEWnL0H+oInyvKSiayTbn94L4DVnYhp7apK4Wk8vLrmGWgX1
         xBzAwNlT7ChaYkrFlVG6mlegvi/Ib7xVfrhSsnwDlSPe35+yyFuTr1fd7OI3daCX/j8B
         wAcozJ/cyQubER1AlGcRL3r/vfuvsS8JrR+AiimQXxWYVUYBrYJBgqoq/4d0/8fHsZHs
         pFkg==
X-Forwarded-Encrypted: i=1; AKwUvByLFwMiBcGWtjlCFPMOhW0FYEkIbQuf/G8s6Qrxuzoowmt67gsDbK3A9qFAYVQAp3x/Y4E=@lists.linux.dev
X-Gm-Message-State: APuU4Z94XNwGxzLkuCs1ah8W28s5RR8nDzzeiMJhv+3EOzOJAQag023x
	mMrTyg/ypJXNhVGkaX/mb6HeeYjbe2PphQIe0D4NTTDuIwppqWiZBu+LXaAbrtS8i0cOrE3uSCY
	6UnRJsf1q0Jrl46x4T7B2Bzo4tyAoKB6nvATSSgABR7WZfN3yL2HrEf8=
X-Gm-Gg: AYBFou28X6VwpFMpD+UaEyvi7S+DWZZpvFkZFwgPY4fMMSfIz7CxU0Jfzwz9Tu/w0tc
	TVeujwTJQpwoyiX+NKBVa+mOe0bpSU0mIBskwfuHYUJ8ubt4j7WV0/2KxSLWEmLv9/KR9IlSrF3
	fQDkvHAHxGLfs03xxnIAXscOhr4B4bmOvZAwLXO2ypXm3H0QXAQsXqgqLTtOLjjtgOwMQhf0+aF
	H1ZcUejKCaYbxo72rbkuPGSYEQHDOGEh5oT4Dq12BGTZ9xfkzYyXqdh6rGt+TTO5sZFQunr6MVI
	rMQC+hDS1pWD2hddLHehl7/OC6EIJeRRw3C2NzCTKBCvYNXbpqJ18RkXyyEkQtRrgvbLK5zXVOm
	GR4ltxtYsKmGk9vxij4u1unIuR11nFSrpsQIo1f7+FPA89gLak+ZMvVllUZuDYcUTnbkiU5mOTK
	v7/47bCg==
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480928637.79.1793706834820;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480885637.79.1793706834326;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364cb511sm1161045a12.28.2026.11.03.03.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:53 -0800 (PST)
Message-ID: <7a873a59-247f-4e4d-ad30-32bb504da40d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:23:34 +0530
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
        Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
        "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
        "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
        "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zkE1u1oPnnLwEOLickg0JPbQ0WcNQgSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfX4CTxgS4BJWCf
 GNzhiWU7kQXCrI++6C0t7yEcjOxY1+pVONZ0ai//qvZM3z11rsDTDTTkdODrOiyVco7YVHZZSnI
 plSE4cDVyLfBRXA998h9sFh/D8xPX0BebCih69TooKkpFyhUo/+FWdxO3GKeWXrPQsXip9fR1Do
 y+8ZiK9cdkNCRu+QwbK1BRqRDy1VJMopRgVZavCOE6ihNyenV4sZgLK43RF9lX36Isdc2su761f
 eXUvBHg04RI4w6immcy0Z/3UMnoaw3Eo+7qSoggM7XyvNZL2A5Efih2C7f0vDWJAjzCPQ41imE1
 llQM80JJzp1dSrlKUvPBcKOrk5zgB6euodO2sFXJ2myGcs+rS5UWl/oXPGhiYQ/PfRcq6X4bhhi
 qaqqodyMZBXwf5M8cNW3W1p2VyqF/EE11U+0LraNuGIWJWVZ/Eoy1njLQwLaL1LLVIu0R5JtzeL
 M88CeNhiBpzcaWWPAHw==
X-Proofpoint-GUID: zkE1u1oPnnLwEOLickg0JPbQ0WcNQgSy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfXz8IDfv4DIywe
 qDpyPatZql54LrZD0zmf0K7c58rNQwSNZSvqs4OXzKS7iTy6SUkHqJgFMuyHlrM6o1OWXlSIv+t
 ad/kDFd2hunGxQtjhGRLaqwefH0fyJg=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9cb53 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030047



On 11/2/2026 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
