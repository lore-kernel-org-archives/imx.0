Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEAB346769
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326509; cv=none; b=KZzgjlBB9aLW01emUAz+aqpIubmP0+x+dbDtU7Yb7EhcPKnOjBSX0rEiabx3inC/JF1NvzCuRrgBO6SrJtlIH5b1FinTMVsyumkKvJUA7ZBr0SSLnEo2B+QOQrZ+9iRwY+HEULMBGrnrapXjJzsp1l54XlyoXKYi2hZd8IbTzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326509; c=relaxed/simple;
	bh=JJvjvXzlCcli26w+i5Hirhm7MyXZ6wjDQGioyQ2O3Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7ulJuQCU8QJ+9eyElp7hDr2kqmcv15UQGomQ5iDhpkoTN2toJWMWSUaLH/WCYcBx2lw3O+EMZMpfy8m2DrrcoSzG8hK5j774CgjtZOPkY77fmB69NfLe/y9EXILqnht8tbpTk+IcJrbZmZJroOuhI3+WLzmeNE4oi6B9wjlBfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm0Kg9lS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iinW8Qs6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm0Kg9lS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iinW8Qs6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666850Ho4006795
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 08:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=; b=jm0Kg9lSibJvV8Yi
	8hdJzAn4zgpP2byZ5O4vxPHA667bXVLXHofUt568kB49iHxnfwvFhctaInLtCjCZ
	sjNHRodxgeyEI+K4Sh5SeEFuH+eYubHtMfiWH/bAUEFyu7LxqpBoChobn1qyHVpZ
	1rLLI4FJJqj/Yk953HEONXVBT+N6ylBmW+SjTQeQEVhfTmxCK8O9BG8vaRt3Exir
	JXmS8JQhSMmJuTk8SMinF8d+mY+jVTVBRkY8NqkZa2/Ot0bSxasJBedLFZ9P4/jy
	oIqrv4PZJHfl9zhVgr7IHFht7qp40w3MPq61gyA4heu2IH0hVtB6bY7pBm7HdH1D
	jKj/ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs837d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 08:28:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92da6f3cc81so339736185a.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326502; x=1783931302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=iinW8Qs6y4j2oRo0Wg44Afnpd9hDTs8gBGGyPCmqlGUEjqwJF5XSCkbfswzckImp1j
         2X1+ESMogzJkx8+EDESkddy7CqJ3q/ThQKoXxatKUpEW5iv5UyLU8btYjE8NGSGOyGVt
         H/OiLT3aHaryfRJqppuTMIUy4MjMrDNSvKd5xmp6X0rzo7LI9N64dzsbbi36sWfsNH7I
         B/DwZdhK7Vhebni/aCJV3Nb3UB/fkw9CTN0BUNz0If6snnkauCn4fIa8AjY4n6SMt7cW
         p9DiUYgJzQkwWQjvYPpi/xdGxUphGDrxLRuxXuodO2gcz4wamS1qUG00AMcPTbIpzKsM
         xeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326502; x=1783931302;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=gSZ1HF8yP/objHnqtkyEnTaDFWiViNT0nxS31GrmFqqO8tphsb2y5f1RtvLq/PqXTe
         jqX8mRafdCcnuq5hf9Gha+C71OT55wFkI+cSF4H+2ogGEF+IrR6qcVlnYcaaBJWxbj17
         LD6/s1wqkGmkLGZ7Qlib6YU1jKkZ2YuHNxW6OHqIg/UlNmVhdEIc316yIw/03AUXF+Y+
         H4yif/L9qA/ZFl0TJpF8TvMdeITUs7wa3loFi8nbFY4y732ZiQ0tl2K7RglciEBDEMz4
         FZ+FCcH6TNaaHLwggOxSPLNsQbsMFVu8+KC2YJvyy3Mxkc4YeMENKba181vhXst+XIpV
         24og==
X-Forwarded-Encrypted: i=1; AHgh+RroLUtmPJ2ytkauLzbncq6imbx5PITEHkfn0UsoJt1FqN2/r2ggKuQJ0Vbne+IYahroiJ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdDz3GwZxFcQPBix0xRmoPbaSYnapm2YfSwKIH3s85oJNYPkm8
	dF1RUEKaElw7OR1hB03a90YW/7Wo3GQArXe/WldOdc80xT9Fur89AbD2xxJcRxUk2qj91kP7JZE
	qgHuUD83waU4ypBWB/7tbKxMETw43dbX8VzgTywleHQoHSjXMTlXPekM=
X-Gm-Gg: AfdE7cmd2RjpcMqPqtjrT8DFz46BmgZ6te7xUf4bKkZpUyy1aofrGe93h5ToJxqICVy
	Bj8zhFLfBum0MxPyLnNJonOncQPtvmdZfBmMzb7uKoYCeHFDH7gpyXc2ZTahisdi+Yj/UKEoCFc
	0R91BcD9jClZbXvjPPjyEAmVV+I1ctfanooOIKqy7BSyFFnOGSFgBFqW6LKlPtldGI5ifIEjVsM
	jBiAJe6GRJRnsuLU67M83g1g3vLFxXNWP95+IKsT/zma3kgq90ub0rvV4KAo4b0I1O3aGG1zBXB
	tAEnPb0ZwqylUfEfUbJYI9X8NP6jyiVBZxcwUULj/yXzvViEdjNHkrUY/yaM6ZOVl49+ayhruy2
	hpFLcN3StmBzsIwvLEv7nhI95zuVpBM9tH/AoDZkEmcRESaG5+OYryfuynzi39Q==
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294192585a.62.1783326501619;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294189385a.62.1783326501174;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907absm677939066b.33.2026.07.06.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
Message-ID: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Alexey Charkov <alchark@gmail.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aktWoIfY_DdO6gb4@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nfYlu5U3FNNVetCtmdSyrsPgAdjzYyHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX+Br2rgeJU2mJ
 upFhAJgUsOwKzLCbQ19KaJnySTnaqNShsX/wjylGSJonFzO56YFpAIyL0jTVxhaKCHyerIxZODm
 k7MKiLB8GT3AyjNt5Lf+YWuXc5Ja5lz9BZ1jDRjtbkgXg7aTQQWGpJZBi3FTUSGoQdC+1GUyxCh
 w19ag83rBcxLLEpMQDu0Ur1sUg97MnK/RZObHTeDCqD16prngeVKo+y4Zwg+7RzxXYjA9dUncMY
 rkWghQ/vzfCXqSE+0slPV+OddFHrcctqaMMpyJC0p4viZwKVJE+bqi224vX2qILn1n3B6KLaRyJ
 NaOyoTz2pMRHcS3gN4bmmyzT9E7UNEVnKS/5/96OR/C7sMx4f6/j8gt3mpgoZpdC5flC3Suz1Sb
 6T8CzzSSqAsEnjLYAYbhnVokg4ZMDoMhiXHUnfxZjwvGhlZlIcp77lvMXo25KMtfYQWMhu8V73E
 MaK5RW0kWDqURxNiReQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX/7N+YuHYy7y2
 DQcNxKBFz2TagKCa8r6keHHjuuWizlSePxHnWDm2fr0QNnFW2oSvUF33pmqjRBTe4Knh8dSl+Oz
 3OgyQ/pNML4u4iOF3CmrcN8/794cSaI=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b6726 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8pif782wAAAA:8 a=IpJZQVW2AAAA:8 a=TiEZW8bMWLlPbLH3YMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: nfYlu5U3FNNVetCtmdSyrsPgAdjzYyHU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

Hi Uwe,

On 6/7/26 09:19, Uwe Kleine-KÃ¶nig (The Capable Hub) wrote:
> Hello Chen,
> 
> On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
>> On 7/5/2026 11:14 PM, Uwe Kleine-König (The Capable Hub) wrote:
>>>    - Use a single space in a of_device_id array terminator; A single space
>>>      after the opening { and before the closing } in non-empty
>>>      initializers;
>>>    - No comma after an array terminator;
>>>    - Also no trailing comma after a named initializer iff the
>> iff -> if
> 
> This is actually intended. iff = "if and only if", see e.g.
> https://en.wikipedia.org/wiki/If_and_only_if .

I agree this scientific idiomatic expression is not well known
by non-native English speakers, and using the expanded form is
just simpler to review (thinking at non-native English speaker
reading your commit in the future).

> 
>>>      closing } is on the same line;
>>>
>>> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
>>
>> [......]

