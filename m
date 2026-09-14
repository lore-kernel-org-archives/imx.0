Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF64229A6
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378251; cv=none; b=g3IOQ25B6wJ/LcOwQm3sqg76D/N2w5jOGKGJKLt4TiBbK7Va/55y2Tx49pVZTX4bl/NLatLVwknyQGjCYvvCQmwQiRrcYYs/lhz1VQfBI4Xj/38xpEveDP86+KglAFjgjjhbLFJoat5t5WnB+T1uKs+4NCh2Mbx/5ylGKkHLgoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378251; c=relaxed/simple;
	bh=LaWXu73lrgxnM+WOLeLQIIpfXYsTiC4ZzLiUEwSFXJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQEhBwQNpTCvpOVvzh5msAy2KkFGfw8oRTQDbaClfsVxoJLXo+AfR0EGSEmxl2EnjCRW1+hxccqYVX0jeLQKmuH5poct6zlEpyyag6N42CHVZFBeXcA+MAmTQiNtWCSGklzilX8/DFYLKurQyjXAw3KwXyA9qLc3FSW405HyszA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaxEYh0A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnEVUj6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaxEYh0A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnEVUj6n"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8KfJN403732
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=; b=JaxEYh0AgFuASaKu
	libuXqFtXFTaPSkzhi/TZSqE/gMgE3Kb5DiXYnnO6C/lKjVoTG8Z3/iEDGoqZlpY
	MdSHWPMqmEzhmVjY0IjxWAVv6la9fSa2lqPgYVstXCEoxwosnzIbCyKbEwHGCukC
	of6ehNzI13uGONMHKCG7OcAM6k9HnXXSeU29/4BWE1x8BQJG9TSUNug+niSMA08/
	JUBE/ORKYw5lisXX3RMUPHKN7+g1o7eHm1TRTgH+ZtSNTe6FNLzjakK7shCMnr0j
	julbwe4DnRPkHv+9ViHp7g1e88xbyktL1c+KX0bXZwybjYzzJ1yJH1sDBPo7UNs2
	sHDSeA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5r7jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:30:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a00c70d28so301112985a.0
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378246; x=1789983046; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=ZnEVUj6nnNrpBam7m52cZ9XjOkw+yBQXt+aOE1THn+L/qpKpTNnfu3fY7toOg7nDRx
         68ZMqJXu7YK7QtrN0XA6na4hPMmNQlhkIM0/g1vAjPVZ0IETSZWr3RmMFodnxSocZ42B
         +F3V6gqVDousI/W+6+C8+zZXq1vqzpQmeuGyc9Cr12NKSoFQfyH1nFon2w4zBTEvJBld
         UFSH5yUD1xlCspxfabrz+l324/BYb6Od3FaxoMcnJTjhmfaWsV2LAFngL/vcj9ErW1QL
         oCOrwi7wRlJP36BiovxHzsanv6kV+/XaGpOewJz5GAc3G4Y0wETOLJSRdmhcnXnKcMuO
         hILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378246; x=1789983046;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=m6Uwm74ChqdoGpaZaQKfb1BKCHYy1vFfpqYYkqqIKQW2+5APg3m3dsk9CCWPsHfVrL
         V+cGzWIWvt02Qk06KOyKIwl3NDKN0p2gAjbGQ7sgiXRX7FOJenO/Ksa5mhvaGfOzj7Ht
         QovvR7cLeAkvugfZbYbX+6hWcHrbsdHzjBQ64mRzt/SXqg1fX2SuoyB5RLi0qsJy3jOd
         ZxKYMLVruUWTsQS7RZzzKbiV076P6ggYRhTybFKTpCQksy0Sm/J7CW17g4oB1AebCdyM
         8dkhYOVFGbL9/RmP0mt0IWd8CyUyv8AKhXSZuv4SRNsovO9BO1B//Rq+Oo34BaKvMX+X
         5ruA==
X-Forwarded-Encrypted: i=1; AKwUvBwRXgXdrSVK1fgNUkGaH2kaM/631yCfTGNUysLg+VyBg7DNn4AJEn3XKhsudhwteK8okMY=@lists.linux.dev
X-Gm-Message-State: AFuF++lBSWJRuch9vqN8vZ1tXxj5ReO1JUxx9mkSN6MqRwH7IlXNNn2c
	a4AyugT5hiG+K7GVXUWnHfRdwxThvSlftvK0Z0B8729P2MTgH5UL/1zgydIuntE8tW3Y6yNwVtX
	2nMv/NY7LPJ9++Vq0HfVbD79ak4TFR32tXf6KyH0K5sh+xgOcmdcXWno=
X-Gm-Gg: AYBFou3JZ+wDzt/SbtCHxO/gUFcM/KDWHeY4B228OCMkavB40oJBwLBLR2CYJYRITLW
	EjaQ/NfB4pI/Fh/baxJOu8H8bRLz0IpEwzLlhYxIQYNRV9E926+lLoZSqS2iICugDB5yxPAB/rS
	fBWpwLwUVF5xUAzU9HzruCmAKHTWC/7SuSDi2igUX8ZCJ9e7l+sNxKjSKGryjCmO+LZ4sxOe1JL
	T5VhhM9mCYJ0BdQ1dE5l9CGpM+E/EmCmv/bHm3cs7xqIuZbhG9ES3iOkTg2BSByGJKi77Jja9ab
	U6Z/9cevlgHqMh/1ZJoPKKVBKD1NUWrclsZ3d40vRxDosQ7EJ91VM/RR/dXl67yy/vTyDFw3hsY
	E+7/CeWtFyOzGaah0LMjFTldV0gJZ
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222696185a.46.1789378246584;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222688285a.46.1789378246009;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm3895022a12.31.2026.09.14.02.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:30:45 -0700 (PDT)
Message-ID: <ad4b454e-0774-4870-b743-fd0d82d0311a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:30:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
References: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfX7804hM2PDhIM
 +00xzzLlGk+i977n7WFgraLTbDoOXr9xrSHGLqSQSFafYC5CN09qDwv3/SCz+MYbWayBpfT0AQ8
 yn8n3QnBhNk/oBlzpedgBkFlns4yUXk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfX4N5x4NZJE2Q8
 VgyB9CAxgvX0SHlRkuvdUB4RuS1YfYH8W4JJrUrJ3sOHYQhGgJ05GjwT515z8U1nalJZs2eTUYj
 zQKYrRf5yrwqf7c3MMzSm5AlWFTISf5B/rVfLMI6N9qy06diPRmzchWcNyJTYPo63q7uklmqCiL
 1Bl6WgA285Mw9XZY8KUfwV/cHrizzgcR6kSB7AOGC1+Eo2zWKaly4Sm6crNAXPe+7j+ZxdDCwh8
 JbmayMeSWkUfv9/4nUBd8Zh20UWYhMg8KDzKB+AZREk3WmnUsDRk/JmJj/Ifvn3WXnxYsxGYgq6
 ZwRR9siOESf3pELbKdfWbOEOGrXSq0r0Hz6LRiL/K1/SXVCwThknp8ws+smccjANPDk8osNM5lZ
 8I302+pbI5lLhAt66XKSgdTTrdtNiqwACp2rhzCrlwxfefqn7lNFXGbic9AUWq6oeHgGpRy9tYX
 GFdhUSV3R9WwNgsk7NQ==
X-Proofpoint-GUID: 19paK_LG56QDFcHX-e9HTMP4fL0JqpJK
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7bec7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 19paK_LG56QDFcHX-e9HTMP4fL0JqpJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140135

On 14/09/2026 11:03, Charles Keepax wrote:
> On Sun, Sep 13, 2026 at 02:32:35PM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> dialog,da7219.yaml.
> 
> And cs42l42 which you also fixup, would make sense to fixup
> cs35l45 which also has a non-generic name and isn't fixed up.


Yes, I'll do a v2.


Best regards,
Krzysztof
