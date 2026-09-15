Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE82543F8DE
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452312; cv=none; b=NZOLxKT/iCJgtN2RuWQRctmMYcMSaJw35gJa7rehehVKUzxMq8g+ZC83gx6ea5U35Q53Ua3LntzFFN3qPmm8Yfjv9vV9eMKX+7s45UagcSBVh+BFzPgVYmfmh50G9g8jSYQM1hDsv4vwXNLTxA2Ivf2SQKmDdnw/FveEQeCprVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452312; c=relaxed/simple;
	bh=lmbl0FDJ8BKHPU7iGiLSRRUOzdLjYSXjkdgoP2gRUcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErpkzXtjdKsi6CCP91ktZXZxdrYH7b2wtdtOxXBkY/fz8SMrbM8yFaI7hFzfirM6kqrkl7fksQecK6Qp9Imq3n3pm4cSf2rRB9ot49HxAWG824cGIjNoO+0Z5dpxZ3cC4rDgeGW9yCYTz8nQrk7Z5QOU7M2doPYpfKc5p/zJ3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYAr1IbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHu8UVmi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYAr1IbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHu8UVmi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F4uEcZ3829257
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 06:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=; b=IYAr1IbJLqKGHlp+
	8asmbPHttAf9fAPsgi74UFS+fWXB2zYMG+GRBUm85azZODOx/3pIAfXSSu/i/kB4
	5bwFbvagZrWPOUNgmUNmMOtSw2B3A8xhIMQ5h595xLXb77yE2vHyOUjIVCOCvKL8
	Yh9Oz+g471cIkF59lwAgs5JY5Fd7nV4JAm37hAVdwzirn29fwbNa+0ePm9SfqOq9
	G7NSkTtNk2EEt9l9nuba4rvDRUNDDOb6rM+v9U9c1h08OTLPQkegwsp/wKoqVhOs
	YXbk2bHC1haLukheqGRPl6ExyoQBrMgHSXBLv+lUOau6J3TMBsu0Bj5d29FWLNCr
	Q2ymAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea088p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 06:05:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso158537385a.0
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 23:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789452306; x=1790057106; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=WHu8UVmiA6KfZVqY+oYXK1pcjTR94GpYq1ONWNifptPrHwFIPWvgjka1VIWjrBaozb
         pJX39ISZhLXFsRqSEVr6xl/xMiJkyh/CQKHpLxlT7xaBfYnhyP9ZffdvWFpcnTOvt5Mq
         11YG1n9i7bOiudlM4+xN2enhKnK3P0WdY/YFr8pWJTyHjOfIZtObhb4VvoFahG4Z6AES
         /hekMhsatEVs7tHBm3JZIlqW7gINNT5ME3CSVD5V3uSg/swxH3wVTLqjrVL0eKer7S5b
         etw6mdqNuPuJYjC+oOrFGQA2T0/4sAwztNZCF0qS5rYPhDGHkOf553cmRhOwVIPTSZ5U
         fA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452306; x=1790057106;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=ZGTdOEqG7bsX2lKqoRzNju/12um7+RcopXqto2FAlj5GV+5GKMOdJ+2LewYUmv0DbW
         jp1DuPydvdt+IIdowKSP99ePVi6XzYHxbqDawtJql1GyG7Z7+x4x5MQGO68CskiNkLy9
         sCYr9HUgNHTiLf5A67B8Ln2eFZ6YgXwXxVu0jV2t0OtXJ3akVDkDy7cztxaYLm2/P72L
         trmPfElfafSAmWPJMgVC7Ldsu6ExencyvJ4wu+1zdPBlZq0ENBlxxFcWVxl6czLJiJJh
         +0jTWln4bWS+V0ja18Pa8aHkkRi6N2e+hvbe06yfmGHsjnQNCkyiDVDw7fTlc6tCOhPW
         EF/g==
X-Forwarded-Encrypted: i=1; AKwUvBxuXJ7amdxR/Qx2R9efhdDjfwJ3IbZlvnEkd7p4EddesvbLRXM6iVuXSQLxD0uVKGUhrwE=@lists.linux.dev
X-Gm-Message-State: AFuF++kH24rnTcLzFXYury8xho4dgI0R6p/MKVShxsEPK7yOgeglBBEH
	LlBZG9FFrgOpsVHjiaL94qXtY8u1s9Jjb/T7z5CJknYqyHBcS+GLnOh4OUFsYVO2G4Zd62iDtKT
	Fhm+VViLR1xveVQKRPzSURG1jHPJKPVy6+cUhitZU06IJEDcPfJ7nPpc=
X-Gm-Gg: AYBFou2+Q1XA5mCCYrGb34scQoishEzutYwhnfyQIi6HSFRC2F/DW2epLy7KqyxC3Sk
	kgFHKkhBHRxi0XEVPmkqgWCioAVDU0ZpcpEFU4YdzyWfA4FZj9XOf2cIzNZBdD9L1ZTrX0vVU6g
	WPez2yNnNyH9CATbxkyBC2q1RV8GUEb5sEz0AGNnhG4OY4vC00KGr8MIvrSGzQQWmydFozDZT/S
	D0IrcAfO/vW6T8M2JGlsL0PHBJRauh0K5nNx4FRgBut6XKdJt6j8DkZq2a5RvFLLEjId9FJr8Sb
	TlHMoK8GQhcVhHF6ArywPlPxPFfpanzzmZbRz7JhzdkGDpUQywfGbi0wsX6IMg56i6kc+KpJUO8
	swz5aZInmf1X80zSHGcy2qoC5sqgs
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323528985a.29.1789452305671;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323522485a.29.1789452305151;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm30648123f8f.34.2026.09.14.23.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:05:04 -0700 (PDT)
Message-ID: <18eff59e-e9ec-4c44-8d2f-f689bd5f1832@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 08:05:00 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqg6VUKriyVANv6u@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqg6VUKriyVANv6u@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZAcdWi6EGzmPi6AvmPXIhdmUAssFODWI
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa8e012 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZAcdWi6EGzmPi6AvmPXIhdmUAssFODWI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX/ZnfFa8nqhFa
 PKg6DDWW9DLTrhZlgHCjFLG+2YNmvVpla9M470kpPfJl1bXPENznWWpXNk3UAx4CphQagcd4K91
 92zJgIix1Ke5WXMF4nQFh0D4TSpmswY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX1cCdOBbhH3lY
 xwrhUcjzElL5f+R7oBJ1ChtIYy9h5kUjW9wCyJFjWUephdY1mbW/UBuWaLro9mwtF4m3u7XcI9n
 wMZ4R0t8IzLUTix+I0kllgRWcoaSxnPBW1+f9FwpUfosOcbBeqOM9SqWOsCgZHkzQl8EiqCq5Cd
 +h7j3NGD7XlkAhFsj8ObQnfIePhhJkm5CZLRSBbHLHUBfg06z+ujvu217GvO3f0Ov4/F00WYt26
 NsVsOzdGy5JVEJiQLVdf9hdt4lTAvfIV4hYDXXZ9Ka/Q8nuj6eacyv8FyrNOQr8MIqZ+cExrj2v
 sUl4+KJHNFqfEidcG++s9zJ5fTBhTt1Nyct9rUY7mR6I0dTc/5xF8VU8JDEQGa5e98fqc+jfT0s
 dFH7gS7sRExgyY3NNe8nd3vTzJA7V+g4VHWwXaDo38A0nWtkSyIUVMxDY7UlqLVRbp6936Alc1i
 GH4kKVvHOBv2G1UezeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150085

On 14/09/2026 20:17, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Can you rebase this against current for-7.4 please?

Sure

Best regards,
Krzysztof
