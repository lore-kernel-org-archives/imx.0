Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255943EB103
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477051; cv=none; b=Bh82tNW3jgjyNxDFrlPUILSwWEOLWkW8pw+nN47OTbZAKifcIIZT7cHuGWOBOaW/7wZben+n/ZZtcQ+3wjxpkfixSOexr+QPQzI7Nza0oww/eojlG7/arhWzmFo6Xbso5iD4E4xVCFVYMV+w7Egv/CscshfGsyrb5Ra/ImGiNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477051; c=relaxed/simple;
	bh=vQWsZeLmo5eF4R9VLfJ0X6Ej2HSrQU0nII1edrWoBPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0PASmqxpUd+0AeXD/uQIQ9xTCL+hFE09yqWmDCXoEpGpDe7Zh4W2BZhHI8AJ3ACVP5PdW6jMCIpLS61mUMfiAA/8ObjnGb+Ik0hPqnXmOIpfHp7LQxqwXnOF5r1t6QcHAa2n2yDXfHFdMQPLinnzyPgx0sRffxsUZqhY+Re1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYO5Z8JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdjUBUGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYO5Z8JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdjUBUGf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcrmQ3384438
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 12:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=; b=NYO5Z8JHU0kLnVak
	jecJFGLGhVpR0hbUX6zKhS2mOwvu3eBGD2sS45i+Hav3qp+2t6pE+pFZ2XtSONov
	X4c4W7LDRDpqtWVzmdsTGslFZpTS3BKqmO4LGnnqliXgF1JEa/WwjDEU7/Ezrmid
	/9p6KuxaPEvOhSqpUkA5GVy8m8qG2l9rSHKtxrQJuoHEKNtgMtDVMTwqW8k0h4C4
	z8xYfav8q16kpDuWAc/V7zyurzFDGBPLE82T94+UU8v0ss6Q1pUZpwbdgr6iiq1G
	xZWHKsoWiebuVTcUtPxGLoPpb+LE34GExlbxY4iBcjVil9s5noXrKfGOTvviRZNV
	fOp4EA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f19m3uq42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 12:30:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-734bafc2646so26677137.2
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782477047; x=1783081847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=;
        b=WdjUBUGfWLx0d4TOGJ9J3y1gUY1AxyBbUtA244KyBWwvrKZRB07Q1src6VTGJHEcur
         fL3h/ljEMBvaOkvL+ZXBiBqha3zYUC5vAWnPPyWlG3ZRrXGcT31b+MciASsrZZavVRgp
         QLCvxJkBsRnfjWXlZrylDgavGIvdimKxIB9HJqyvYh6LMiGpYgz83QAB01TrshtXaITH
         GUmldb4d8g+2vzbUwoTQd/JAJL65rpbiRBVWjr7/bbHLOX/eUCQdzouFfQJhq06q1H++
         beCbKPBChpaQN0A0sOS0t2mVqbQHOZ7ghqBTiwfgGx6w+QJyvBjp+Ut4eapqXXMlODat
         3xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477047; x=1783081847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTDIPGRvRpFqA1xlxZmp5V6MW6Dxq2QB3L1ZJBk3cjE=;
        b=KPOZ9ubfSzywL9TXXTm2rIegCXZ2mHH5qXuoloUaQFrLxPw58ed4yqVKIQSvKA3taD
         e3HJC8x++cq9PcxFHKy/YI32mGkf4PFh/DCxLfpiYZMSiTZYWqk0vF7kkWsVwcbVAyRY
         CAvFkhUBZ4m3GDg3X9xsYRQ19wPkZdB5x4qmJZ1z7SGMzjdbH7uy8Vy/FDDm9ZcQculZ
         QmVvzC/1w+k0JFpx0SZ/wWN9AiYPmzbklS1awQisaRSDOI87T48jls03b77kSZdNBrT3
         EkD3kDqN5En7Vk/F5aOZr4TJ8AjswIvMYVAX8Q3g8hp7D6wMH5n33GCH6xzH03T2Q/80
         CuEw==
X-Forwarded-Encrypted: i=1; AHgh+RrpxQav9tqxfbm+2mLPzfA5yE01KhYDrl7FYLstVkaIzepnKY9rEw3UAtB6XDWVWjwJRm0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwshmA5Ja6Fl/S+lO2UCoprtO4Go6tNEwDKz/xQjv/wIMsE7s37
	uKREJYgOtiNj5BHMEBssWFRU8/1k0poP/zVLZ9ebPC2RbFIlmyA/7Cz6NWId2G9ujvpzWcFG1+W
	72FSfh5Qr82sg0hAJ3yHjQk/4jkZnEe7FAfBXJwDI+AcPMDuERPMLZlg=
X-Gm-Gg: AfdE7cna3YoZMWyJo70OdU0iZGopNnwk/1iZUhgFw13gti/m2+iEbVRAv/VYV2Ii+W4
	BRxMFW7oicERFyTwQrbpulLIAgB3f71iY7BDEMy44rHKzXvxQ7rQXJyxlbIqHZVj7QvEEXnUALK
	CnFb9aHsJy20OA5UlHzZwuRP5Y5uXN7vdTbjD8vTEz+lsyX8zu1439ITrPwxAlNreBvK6fhGB+L
	HbkTcSkuFE/IUG3a4BwfCySsCYdDD7AAn7MnnGN68fyyVCp5zUf/NheTx96xyhPS7kwftVd8RHb
	aisgqZpuYed1puYBtzjyJjSOaZTnk5FCH7kxefDgMxBlWEv96u8D88ODik7+l0JukCfzWn2Z19o
	q3a/IhOeK0aVYJ/i0Gr1lpZUbzRJ3KKDB1AE=
X-Received: by 2002:a05:6102:50aa:b0:634:11ac:12ca with SMTP id ada2fe7eead31-734362a85b9mr1107942137.5.1782477047282;
        Fri, 26 Jun 2026 05:30:47 -0700 (PDT)
X-Received: by 2002:a05:6102:50aa:b0:634:11ac:12ca with SMTP id ada2fe7eead31-734362a85b9mr1107909137.5.1782477046707;
        Fri, 26 Jun 2026 05:30:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe5f73sm325659766b.17.2026.06.26.05.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:30:45 -0700 (PDT)
Message-ID: <b74b3123-367e-4f22-a910-a2ceccebdf9a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 14:30:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux@ew.tq-group.com, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfX50D6Uil6CzsE
 tQDW/92Ib4un9YuPO5enYgMUDaXY+lEeZVDvx7fnBynyKqlDFMp+eGq9WJueFABHUI45Tw8x5ch
 wM9oazgd4LNZWxxt2BFLtBS6VFRExgA=
X-Proofpoint-GUID: A88InqORhCTuSrp1Zvk11VAlH3EF8JzN
X-Proofpoint-ORIG-GUID: A88InqORhCTuSrp1Zvk11VAlH3EF8JzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwMiBTYWx0ZWRfX2AFpsM/g4Zte
 aLDWvjdkbqwyeYkOLh7d9cuT1tSAm4pcU80BW7oFNGLZFY2nC+K6vRmCTOdma1hyIxkMjc8DrVp
 JoWYWctk5+iJMqxEYFpqRXeG0AJvmm3T09Hn8pinyxtjLn9TL5vf+9mJ/pqLlrRBknuianncGsg
 MdbvFBgfgywqZClpGxPLmue3WaT1dM927Hh59XtZf56d2CUnpVBExVg7a+AFlpCFO4kf88disYf
 F+TX9xRWShHfFew69HsXFHzg1lqBxV1he07LhImhR82GrSZTPFUJdytMApFa3RiFR7oemVRpIDj
 bN0xabQGYJwUJwYqBH74puFXULMq0oYDuJHreYIYclIN3tHvEMcjNSbyxMNigNOz8cwaDC1U1s2
 Rk37xysjr1xO7p42JsZQVUuYqyZpu53C78T+8ma5LLIkDWAbIsVFQYfSnZY8XGyAnVnGyJhz2TF
 fPuQDUqMBa9US6eENwg==
X-Authority-Analysis: v=2.4 cv=Vv0Txe2n c=1 sm=1 tr=0 ts=6a3e70f8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=O-OUeni-LN-QTous_GcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260102

On 6/26/26 2:07 PM, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the qualcomm device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

Finally someone shaved this yak, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
