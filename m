Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED12576ED8
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097629; cv=none; b=W0VC/Dv1Osc5s+wVi/01ZNWMMaf2WucK2HajXR5M0DCfWFsBa9uCJ3rOHAT+Cm+sOXmPH4xdm0Q94q9Q/Id8N6MlGYxdTgsDqkfrKiNMoeAJH5jVEFkxpvrMye9ySD1fzrBZVwxvKwE+1qJYkKxbL0nSIHif7dJBXzQsjXirI4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097629; c=relaxed/simple;
	bh=ZgSvG6kKG9iSmJMEuAW3BWVeHh9wVylo4E2yoG96D7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxYumpZsMbriTGTZFKEz7R8o9RqUJnfB1ssQw3bZwPjBb7qFpir3mxZHzDH0utaREQ8LT3YRJkLJHxMrWBb2S9l2TGIINuC2jQf0fPAN0/intWE3ChrnSG2lm0yy9CsaSgeDyBCOgXSsGjl/0MYiVWYV1oRk7MXdRXxRml+UZzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLH/+QUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqaKWcKC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLH/+QUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqaKWcKC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjmSl3952767
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 17:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=; b=aLH/+QUrcKEdduB1
	g8hbwD/QG3Lz6Kv7wEz87IGYoHZhTkAbB+/26So2s4RjiWefqzBQ8ViVSPuVHA+X
	D96kFcu/jpSnnrhxwl37TbM/ebJsDd0HVHzNDafxcwS7wFd95Q2LRCOYzYr6pcro
	6ECt0jJZZSIf+t2R2J8+tJY6jJB2Sqly0Zycd2EFNzVbKhsqdy/oy+TL++8Gluev
	fedAW/8OoClqepQgz5usalXYgcRRulEOLllXxid86JjbG0rmHNsllFjzMQ9R1IsR
	6NK0wU4G1Px7lqTyZjqH96UXE1vMloDa5dcNEK3v131c79bjfkiXemDUqbKjbio1
	2dsWIw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqbtv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 17:20:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86917d18880so173199b3a.0
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790097626; x=1790702426; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=;
        b=SqaKWcKCmmoPFGjcbY3GyQK0jEyMl8Lhf5PP+woAGVEiyTqs1eRmoBKCFmoAwX1EHY
         mWfxRibn35ljaAw3J+vaNK5FMpXtKXlEaVPvUeclmwWbNiKtFjQlLXncAQ+jsB1HQDeL
         VGKUfK/DtnTxGQizgDLbfFb5TH5OJbQ4GWdIomKF88uvFrGejQmbx/V5JgQxDpso9ZLl
         EtkphvAwTdtYurXu5lWfDVsF3kT6qEYHGnTQgmvhy6CwicOTfQAPErfJyPitKMjf+gRh
         LujKZgWYXwr9ow0OJYYhSwc9BBdXCIb4fiAEZgyBa1bYeSIDu0jIyYJ0AYyZkkAG/cCR
         2H8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097626; x=1790702426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=;
        b=gV1RGQmXZSc9f3Zg6iyrf/KSjB5BYETNU6msc9wxH40VWyB1y+wFeXtIVJH4gEyDix
         cvf+A+Z7PSQlB8GARB9vY4VlPiuT5qBxRwMmctap5iQ7Z6cxSE1SzZVbbcZEqmBHIMdo
         ShnKSYkd9IZa9KxcfjZng/WpCvBkza5wNvVk/bkn7rHeW6GGC//o9BRhSkf2nEdVZULo
         GIMKiIWvRcvTa0i68QH7gf+phW8/wnqjqjGT903URr3i6ktlimD0qESSa+5Q0+A+HXRK
         6E9U1sTXjCLZPsMLS96Z/ZnQXvLMmFRTX10tZm48FhBu6nVuSiNTqWv+CbB8oHguBons
         iU/g==
X-Forwarded-Encrypted: i=1; AKwUvBzgq+sadRYeXqCROQfC73hA9gCbfG69b8oy1RVH32kHQx0letYgqYgKT0fr+eQ8oHT5DxI=@lists.linux.dev
X-Gm-Message-State: AFuF++lx+2Sq3hlWqDTYBxg4N7VG46SUnHhgB2yHGae29Q3+8NckXZXf
	9dQPHq4bn3l1TGp7tExZQNHPFM9p5OVYaV0farS/zMvPP+UtWybxOE3Y6wjUwpLvMLgHoki/biJ
	WSOBmx5BXkt2KnYurLrudZJ7ntUtyrYNH4mwYmh/0UeBS1rfJMIekJx9sOuJOLC8=
X-Gm-Gg: AYBFou1kuP7eDNeh9d7JMwIp2qJgPiC/e5q4xUzTGqz/tZQ9vd4rA4kAnWkmNmftX0b
	SGXBTXNYOAwyOwgit/hYIygDc9Xc9VAkS+8pxjQnw/Hdbzxg3LJu4LQvrwHtPs2PoyR4237K5jz
	70GwwREGTWkNZEyga5mGEjcJgeXiarO74dbYm3U3zUp9GDc0C+wcPpYhNNC9RhXdNuGoRgNzYCl
	PlKAV/Q7N3eRIFI1IVBy6y2ptOUBb0ap8ZaC/9XMFuGkigycSLQX4T3InX1RRvInouS0RgY4MiW
	X4AdvBpxVwFbXsDY8QVc7x7JYnC8X/V+8g6ymXTAo90RCx1XGXyUgF7O2zgyRZRxdN7Z8JVghuk
	5MXD7nE9h/CPPo3Ii+UibBhBjPVNvUg==
X-Received: by 2002:a05:6a20:3d95:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3ddf8278bdamr129796637.38.1790097625353;
        Tue, 22 Sep 2026 10:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d95:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3ddf8278bdamr129761637.38.1790097624786;
        Tue, 22 Sep 2026 10:20:24 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.227.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a1d386sm1295837a12.10.2026.09.22.10.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:20:23 -0700 (PDT)
Message-ID: <39ac1f45-057f-418f-bfce-917d968eb495@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:50:13 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
 <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZuoPx1ivBQF-GdH4pCSQmsJrApagPaRj
X-Proofpoint-GUID: ZuoPx1ivBQF-GdH4pCSQmsJrApagPaRj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1NCBTYWx0ZWRfX5ASm9H2TdscX
 AjMe6FdvU3cinnfXUzQBRKUvSMFikUwKtAM+JyYFliGTtjH6Seyg8nBbz2KjtOMOh011FyOgEiO
 D5xw0ovBvcU8xnJlfUuSDcVaAsWd3bM=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2b8da cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ISK6p04Y8w1qFYbiysbuaQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=sGt-zapad3vFaLHLuqkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1NCBTYWx0ZWRfX9DAhrLNIQua4
 nqiftxxM8bc3Hx3nHc1lePAiUwaHQQ12e1R+nh6Vo7xmO03OYlGWNCgIwNuZq7eWWBHZhzWHFc1
 O/fW6m6DD1R9xweOtwKY6mypgMqsnp0G2VvwebdPOI/p4xoKBcF1PAfkfQTvPgrt8h4eFMEtYf4
 9TPJolY/IEZDKhOLLChBC4ARE6qI27z3O9kqdwBGS0ob1tI5PN58bLGNo4Sw6k4SQ9FEx29D3IX
 iQGlYsatqQXgI7jXm+BEkXGY+Bnzm/V7qDO++a55MVrP3xI74dgDSX1dj60ZlBHxaB0lFlb8oKt
 PJUC7ZTatEoI+2zzJtEbJ6EoGtEckSCfpXBOQW0UtNcUPSEyvDHYUQPMwDxMJYevDQfoHsZk09/
 Tzq6ETjjz6BlL3blJ5tDQ79YqxlFF1hb3VDDCej4XOR4shnG64P3FnBxGkWPlEXqKVtYNlWS4rZ
 CZc+v0Q0EH4oNX2CMRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220254



On 22-09-2026 21:23, Konrad Dybcio wrote:
>> <&imx577_ep1>;
>> +			};
> Please realign this vs the hamoa series - define a port in the SoC
> DTSI and reference it here
> 
> https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org/
ACK

---
Regards,
Nihal Kumar Gupta
