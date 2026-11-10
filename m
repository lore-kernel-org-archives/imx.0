Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310218;
	b=mzI92gDAx0wL5eCqGAVZpnGna6z/9yBZdB09Vl+YC55hdii9aOllh+uXHRCh+9bBGXp+
	 liOKw+8HDEuzhRqL9EqR5T5eblxQ1I3vRpO7CZeX9HXlITdEqLGqVBEGCooW5qubz8NYU
	 vl6xQdnjQ0YJIcXbyFSK+ylyzMp85Q92kaPjfOEitkPzUk/meFUlj9d+2Vsg0h6Vo0fEy
	 MH+Iy36rMbFVrkFkN61FSdoA3wOuFbpaKxRqyup3b07iL5ovvwkKU+e3v47Fc5yKpkyto
	 TEg+Rg71s397+hxFiGFuHN2yt+j83pV3xE+Gvi8RdcaejtohKB4SLGVSCOEPfufigOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
	b=417eq2oq1VLOBacNQEmO+L1kc6mDZ8BxtvE1JGDrzio7PLfl4LFomtBrH5Cli9F4/Wmi
	 jKMhSEWT4x4pxLjQfODQkHJNQW3jMNsO6AvvsNDNy7YBE/lp/heBegqrb6+8pkeHOUzkj
	 nzJlB5n6LkW/D5r3iTQIWdEh/9w3R3qZzz7KrJL8zqtHcRGo9tWRW+tzkI4mwhQmu7c9u
	 KWuseRaHD9i8LFoFCyiqQRzJt+s7Wsq2wdC6Lwzf1Rtl4VfmvdXc98Ilp05OdvsFZunc4
	 zs1BJeHbG0Z/QYnhSnDpNnN1e7lYMXIcKmd1XbUStVgJ8vaHl9uAHPEHcIfKzqw7lSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MN5FEbyq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6591F606A33D
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 11:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6591F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqnelBNb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MN5FEbyq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAHp63178266
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 11:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=; b=QqnelBNbbS62un9n
	7ny8IsyVSWcBmz6Xf0VREBrSrSnCpvech2cV9YL94kXrOxcASwIRy+h0AgfiAoJD
	wyRFSAVn7H63KnF7UbKqKoCJakBJpBuVgVNRvm+Ay4CSdZ/YSMdhSSZn6m8L9DYU
	WcO21F0zTvhilgLPVXqBsbOXt+Cen0SaKaPoPHLE6PjzNMk0kpkiiZcn95esr67N
	6GJVmIJaeo2anyJbus5ugKMVf8tIKBny/CgmR0ge5/y6N27TvXOF6QvgDW+OxxWV
	lHEQwLnrYQHFb8uZcvaevnC388/FCcsTQqssJMV+7tCTgjLAUF00r8jkfeS0mFBb
	QV///w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrm5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 11:30:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso346027241.1
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794310216; x=1794915016; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=MN5FEbyqVjMQulj5I5YuFzODw6s7PzDU160xuRvGz58R/xATXqbV9QJeks9pqiIZva
         LQ6/QJrZA+b1FpbA6uHAM8f6GOM31WLkOzap84fUSSm90Q4k3G0j+BdDpvjUsCx6Q1un
         d8jLT4HC8+jwfABzC2M82RgkKNp/yT3c6ZU7aaGZx9vzIZzYmOta2N82yL5Qg5Mh2LwD
         3kLz9zinI9m3stM5jl1P6h2HLblbq7HYTPcctmNmtHSPZDUqJ7aFMbkyM3zUO4SBlKxh
         BAnhA0IwFP93g11Q37IH40uJJIppYdXLxrqxkvTHXSiKgtqTyw/FJgXPnf7sqT9f1mgg
         FzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310216; x=1794915016;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swew1lvK9VYq5HiOqRj+C1680e310sD/zdYMSu5J8YY=;
        b=UHtJ81IVziUNvg1eHkbysWlIiYV0JcHhYrvtH/UPCKZMNuixA9YFFda1nN4heJL5ws
         ABsbnyhy/2pKD8ymizvUywKmAPEZ3zCDkkaNOLsrZ8Vx1xUxmvoZFw9j2paDHSKudN4v
         CfgUxSh/bPvwLvbMZzhvp25M+JP+tPh4xx1LHueEZY4zEVRG6rzQ056yjIG3s1AKwxFy
         c9YqsiveU0LCAJDmRFun6iEV4xbrpsgM9C5UVwBxpmGLkKEA7VPNrafXZ6WW6S08wHjz
         fOLosApl7NISWp18cs9AL02onqS185ibLfzvkXP75n0rqSjlh8/T2e50B+5cPjuhxOWc
         RXCg==
X-Forwarded-Encrypted: i=1; AL+hErFILf4lTu9PVBjcgg3z4A2/zEOGtENvztJ8xAGgmWT84QaFcH7jNUDciFD876/UrIEiHRw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/64FBuhM6koyUiPkiVp047G3oU/cW7g/0AAFMeU8a4fMcJgVwT
	GXIYEd5VpkmmCtdsaHKLtgNlr9sRjARvdt0+z3cI9ekBsf+Xgk7hx1vgD1STdvGZWrRgh5kwiVG
	0znQFmStLMf1CSuwvwJbW7jQrYOoXhhcqd6UVIlYguBJaUAINJli5YUE=
X-Gm-Gg: AYBFou285PSEeGFxo89NqFcSpO2e0O34aaE/6jUjTQkvuGyHzr0Cjlnifzk7Elml0au
	5rTP42S4XPt0rb9FbOPDart9ZRLoNUan0dujctKzxKGuInyawK72rmU5kI4rACwSCF8HsvlR8fS
	owKsy0YgMApeNE64biUUfyybRYgM8OnYldW3OxMyf6SC2LL/Z/QUjlUjTMsx8sPvHEXrZsaAB0A
	swJA5ucITnmQFkMhXOkJsigvr5PTaQvoOMODRoMNPrTuUVzKyUSDZcEFHNUI9LlkTKxOaMd8/De
	KbCmm6iGs+UTNBqoorY39oBUewfPd8L4tZ3kkyIr2y3iWz87TeXFWAt3jnCrZTZZrgdy4ebIBOP
	zRFIPlABRMjrbyJvGGXnSDNfnmANob5jkOUZxgmx7w398Pgll8PuSOW0fQUZ2FjB0ugK1eniFck
	GJaksPdS6XiXoc8iS8AAFMoKWXfXZUxKU6fAFfp2hI3ZtZDNyYEy8+f2hwVSMN5g==
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613076137.11.1794310216487;
        Tue, 10 Nov 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:9d82:ae17 with SMTP id ada2fe7eead31-7d301b84485mr613056137.11.1794310215878;
        Tue, 10 Nov 2026 03:30:15 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm68744635e9.15.2026.11.10.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:30:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
        Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: (subset) [PATCH v3 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Tue, 10 Nov 2026 12:30:12 +0100
Message-ID: <179431014821.61906.16254753709778386743.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pZ853x1ExPqErnk4ON42tt1ezbgCKWCa
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af30049 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WvVV-90v2Qb5btd7p0QA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: pZ853x1ExPqErnk4ON42tt1ezbgCKWCa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX/gEEyRZ6oggc
 zH8WiHVYX3KZsQ36ulx0TdyOR6Q4COyNRyT//QF9SlNq8k/yMQxeRJSY48wRmnEIg/YRIywgHtg
 ku6yqJbJqn9tFsICMDJyBOO5uTevGsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXzV7in2/lpxkO
 Kqt3tN/h1eik6CttR95ErLJsbuX5wIQHWvben2MqTg36x/X5Fp+HsJDgdxUt235CPlDpisfENcE
 D6TP2Uj3GEcXI2Zy+1YEwql8HBirEdq08Scoy4qviqikOZn/2ss+hxavlO/9sT78qTzMRWPcH68
 oCTy8tMvRgXioKd1wE4H1P9BbAqXkFnRunHGZcu4SQT9BDGaGu/hPS6TtTdlzqwVCyn0DXxo/pV
 I+qMC2bWyIJpKfCwGiFJRYvJvdb1kgmolh8ZHaplRM1r5oZU8EgvpMewgmuE5CHuHPP9VISpuIf
 uPT9ird8L8XGs0CVZGVnqHuqQjZoJID9mzfpNuDGKKFaBEV0LP6MShPtN6TwvGO6dxS2Rhr32gR
 N0uqDFZEZNnBtN39ORCfXhAUd5lGINhH6LlcbMCdsa/AQzXfmA2sFH+GFYGg0dxZb39RZELDl8o
 +oARKA9yJSPsADIc8tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045


On Thu, 05 Nov 2026 11:52:58 +0800, Peng Fan (OSS) wrote:
> Per i.MX8ULP/93/95 and etc reference mannual, there is only one
> clock for a GPIO controller, so drop the 2nd 'port' clock.
> And for i.MX8ULP, the 'port' clock is for digital filter for iomuxc
> PAD, not for gpio controller. If we need to support digital filter,
> we need to add the support in pinctrl driver.
> 
> With binding fixed, to avoid dt-schema failure, correct gpio node for
> i.MX8ULP/93/95/94/952.
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: gpio: vf610: fix clock requirements per SoC
        https://git.kernel.org/brgl/c/cebd1c0961d802092bdb68c591d4007b1b662296
[02/11] gpio: vf610: simplify with irq_set_irq_wake()
        https://git.kernel.org/brgl/c/4d49c80223fea433266e5b84464211c6acd86347
[03/11] gpio: vf610: use devm_clk_get_optional_enabled() for clock handling
        https://git.kernel.org/brgl/c/00e3c475fefd0eceb7e1e01305ae3587e654bd94
[04/11] gpio: vf610: drop unneeded header
        https://git.kernel.org/brgl/c/78b100b8a3d2119b141041ddb3fd358190c988b8
[05/11] gpio: vf610: drop unnecessary wrappers
        https://git.kernel.org/brgl/c/0cd60ba4dd958f343cea5970f237c80d589f4cd0
[06/11] MAINTAINERS: Add VF610 GPIO driver support
        https://git.kernel.org/brgl/c/c8c2a017ea2e656c3e85cf39bd2bfcb2f460695b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
