Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4F41F7D3
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163663; cv=none; b=AdrabP3SESdgsua2cZGWh5v7K44PwPUxWcq9yjXlwDZysC8YMzwMenG363/otHeQWOkKkjst3p9Cp73b4jr/3S6I8N0r2AWbY7sbqfbJmZ+VmHeIL7zyyRZx/vxRW3QsJRjp1nmYiBaCkGsc44XEuhdlwnE6yX5yCGgCnMZdEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163663; c=relaxed/simple;
	bh=rMyZU+9I6C6ppALJ64SkDTUnn3JK6NJ5bZy9+2tmqPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=inFY44T7+h9MrRaMYYazA6SUCnOToJOoXGfSEBPY9FKlZTf0LapZDPewKkXhfGdQGOxzplDbNXc9zuhN57NPvIx+9eCPMmSI+xAdLKwE7RXmrDEoIm8reIOVKPOiYryfmwlyoe2W9DxFoFJHEcV+8NTMYDOAtr8Vn9FHngyHVZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fg9OMB4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikNeCY/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fg9OMB4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikNeCY/j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZIf4115060
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 14:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=; b=fg9OMB4Rp/B/Bd1a
	GrpthF/QtlbaAJU2PpzNOItCg991o2X9dkm5yrkmtr8CrowFIn+Shxou5cw9ZP7f
	YBtFbT2KvY2lq9c96rvjO/2EIDjJt2lbb9plwY/K3twlDZA3rJFxfLdsUa9/kGix
	VUIpfzBZjXlKlmZMocc2sQ6hP60Zi4RApif2RpmpxUDCD1RsSFuZqMqdNn+rGXqj
	vJ5HQMGmBwNovecawlleETMT1Jif2YeucA3R3/UFe+nml0LZaOW2CO2DfzNrdQLE
	ueC64Nnn7zgHHMamZcQvOaUFjH2mTu8jbBI0zfvY20wrI8nO4jw/cSnPDwpFLWN7
	cRTbcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrs8jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 14:47:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so36287361cf.0
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163659; x=1785768459; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=;
        b=ikNeCY/jeMEY/QvR/cV+7/Q0f991Fc7WnEwkfXjOaupLp3qy9XKB6mvrRnMHhERdsm
         w7B9fQ1LPuFKHuMBV2ITAjUleDVlNMPDcBMPkTw3WN2UL/i/b6ljvjJO47oPJmGACBog
         xfIweTrRU0+uzwPKP3EQd0W0MlQwj09XI/Qzvdt31PnHdgo9nP0p0/W6p86ZIpwb6c/P
         zmLHb40/o1KknKozLwlq+sJ6/atNHhoLuzuTe9mjqLmPqLfFrWotaR4ccHeoUNUS0pXt
         bCdeyjtQ3ElQUrI0tt7xcAHAxnzWD+QYISKEXW5GEFenrRwB1Xiv50apj6z2175GQq8X
         u1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163659; x=1785768459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=;
        b=KrVoH6ItY7Y/azEX5PSa26JAawkJ6iB8vtggzqdvSFDDNvGMtZ76KKTc88p8208Cb/
         TrPq78XQiR77gerII7cFdQD5wnm5ShAag7MdqTyRM0F1U4lMVgdDzww1P7q21d/Im7pM
         R2LYTkc5iul9Wx9jwDJyZYkWYCr8P7/dezLCtSI6wi7xuB5A0fvh6Wf2VV2SdT8n8s5P
         j60a91vSaPo59NhVUT0tvmnHHTCQoc1F9S5GMIMWu6jSKGA4mDaRA060IJD5Do9apnGq
         tFDvwbAZFOF6ksW5NFjo1N17GzZVvTLpgO1sjTljwQJmsKAky7athZ+cia2RRB13G5p7
         EmuA==
X-Forwarded-Encrypted: i=1; AHgh+RoEpCW33r1ozwuf7E14gtxROEucH3FrQdNqOGD3PTJRlQwqlGFDZCkrSMjUkTx2GnbYkmA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVURLikwm1GEhkqx7dYtLsAn59VMc1wsH7I2B/goky2ps0Zwbm
	1svX9Eq3ZrE/pi/QaTF1duuJNljd0L4+HyyMyos/L/pC9iK1bbNngpDanbgI2Fd1OBez9dxwLUg
	wglHOLcmMrEZ6nrN811LLEd+k4iLTUgUptsCRkBJuF5ZXljJhAhZnXn8=
X-Gm-Gg: AR+sD12jSHYwnka7na0QPEvL7Sqvv2+CypUXnyVtxIsfFG7d6XTyAeS7/ZMtRu/0xDX
	FiO1wIVW2+LNsBdbPFrkxI0NGggqmE5nzh6aqKV0SsYf5qcoRhbcvYk6Dlo7GLj3ovY88vTTP5t
	u5UI4Z9o9TQQw+HPsTjpcO/QQR0C9FeY81Av4tQG2FU91vwx+S1W4wsIAjeQ6wVBt4wT/skggkC
	f+ThxP8/vRZJ7e8stx1tHDbMihLoGcoffKkLk/q4opOCac9dMBwsEiRWAfbAlFe7Ui6jX9dos2J
	D/PEi4QURFPwKhORPaGXs3Fc7+bfVfKbhsqx6mXmDSDXbCSdqx62rkVXXWVGvmI2pMQtH4N+0vg
	OPyhUh/X7U3L90wO8FNH3j73HXzF7u6+wK1txAiVCCJkJrg==
X-Received: by 2002:a05:622a:314:b0:517:c65c:4987 with SMTP id d75a77b69052e-5295d37817emr113813351cf.22.1785163659240;
        Mon, 27 Jul 2026 07:47:39 -0700 (PDT)
X-Received: by 2002:a05:622a:314:b0:517:c65c:4987 with SMTP id d75a77b69052e-5295d37817emr113812621cf.22.1785163658666;
        Mon, 27 Jul 2026 07:47:38 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f5f9f8sm227610155e9.9.2026.07.27.07.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:47:37 -0700 (PDT)
Message-ID: <07d7fd69-808a-4106-a02a-dd77430bbc4f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:47:21 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] thermal/drivers: Remove redundant error messages on
 IRQ request failure
To: Pan Chuang <panchuang@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        zhanghongchen
 <zhanghongchen@loongson.cn>,
        Yinbo Zhu <zhuyinbo@loongson.cn>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        John Madieu <john.madieu.xa@bp.renesas.com>,
        Heiko Stuebner
 <heiko@sntech.de>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Laura Nao <laura.nao@collabora.com>,
        Mason Chang <mason-cw.chang@mediatek.com>,
        Fei Shao <fshao@chromium.org>,
        Frank Wunderlich <frank-w@public-files.de>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260709023048.599150-1-panchuang@vivo.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260709023048.599150-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfXwQbiDq5Zj4di
 OZ2QwEu/Z2fXiutnczbwBw13vujDv41vW8kYNlCor4mcdTr3t0qHPK16ZrYuV3EFY0f40K1scXR
 vnmWtgFi7wYNmFOVNW4a/LJj4TXClso=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a676f8b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pSU5Y2q4KNMKwdsDY74A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: eTuABoYCyw0kS0qojw1FzC-Y-cclRa3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX5mr1cnfvMnUf
 kaXAjmeIsjmi/Vfcz7COFzhD+k4zAdMiFOgyZj2BW6EQJVv+vN+XaUnD2ii2qlbolRvB8m0ZpuL
 x3r+aJ2pGgHf1V4VimHseaeQXSMWdSO/VSu/33M6p1u0BBB/nMDZ598Jsngm4uFBPzpl+R+NsGb
 KfeOG3BWNi4eySR1d23nXga5Isv+lgBAKXnm+47Y3TYEsLTD9rUHaHInHvDuBzxrr196ufj6ZuI
 wrx34Q8RHWr546fkyfqRCG5KL9ub2CcoznJuzND/EIMNklX2YOiu+/uzrqaGNSYkmkqdAjpiU1N
 9Sb7FsP+Rqd75OCFRWLFXLnfifsfp6cA6LesXLHzI6xjHf6KG8s84qDcPpCnWjgpOZJD6RLJ2+y
 8fpXor98EL+tO9M1dIiTTcw57AuRKyRYMgPMz3G4L0vUS4pbKyc0LRDIDF806B7BclNYX4SBgEX
 HSZvVSgY7EkmWo6l9Bg==
X-Proofpoint-ORIG-GUID: eTuABoYCyw0kS0qojw1FzC-Y-cclRa3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139

On 7/9/26 04:30, Pan Chuang wrote:
> Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
> error handling in devm_request_*_irq()") added automatic error
> logging to devm_request_threaded_irq() and
> devm_request_any_context_irq() via the new devm_request_result()
> helper, which prints device name, IRQ number, handler functions, and
> error code on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this automatic
> logging.
> 
> Remove the now-redundant dev_err() and dev_err_probe() calls in
> thermal drivers that follow these devm_request_*_irq() functions, as
> the core now provides more detailed diagnostic information on failure.
> 

Applied, all non-x86 changes

Thanks for the cleanup
