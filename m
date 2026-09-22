Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7B5625FE
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092431; cv=none; b=RFQAfZRdThT66MfXAA7fFnb/TBMGzNxS2RgdBt96vTgKEXuiBRq30o+TSxG/RSM6iYJRIPcLSJ7Ix06jBreYH4zx88eC5QDS/6zAfCyBIlfZgaOpnB+vby2Y9knP2JzAF8jz+aSB5eSbc1RafrnBt0Alx2iJulWYG34E+TS4/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092431; c=relaxed/simple;
	bh=x2Afa3TS2BODsNDUCq1vjP7z73/Tlk0WEhCAaO8UvBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNEQwsdbZXEGsv5vb+rgVjxJrMefJJn2r7wsf/noG+bGKarSqBYqLbM83eiB9X1O4DrxarfxQ7wtCwa22OK+1UE0GOUIDrJbSetq9zeM3PrzTSqLlTGESBIssJieqZsVAc2/PCQL7Fwb1+H6ICx2kg0Hsxs/dK3yTXxcHKgGbbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuMeLAuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTPYyqPL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuMeLAuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTPYyqPL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjou73952905
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+J89754OJs4CwOKUDXJfrEClFP9Q3mGTwu9yywPVJA=; b=NuMeLAuRxk12TzIe
	2IIKpHxD60B9aAf3ow+MH682YLp0nF6MS2HFAXX94vXONizlwGdqGAAN8sPJWzRg
	Gq9U9BEcMqtYxGyeZcoJHRdXXPjfWEKYhfaW82mTj7tzVT3UJGpzXdnzX5Az7ynb
	LUwkFaaqqddedNOJCQ6c+4ubxNthQFBXxxquvTjrvVD5uIQzbIwt62deMogHfY8C
	khe+yMHcpSwhrgpX8EZpa2sgiN5eKaNVnSncvYPVQpJmTS5cG1Si5f8ADGD3bwBX
	Z5QlZFbkrJKiizsw8ODUnvVcpZDrcDW3vrswzq0u/yc40XqZGiBcUblpn/jX5HwO
	FBIZtQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqbdb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:53:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so240538e0c.2
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 08:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092426; x=1790697226; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+J89754OJs4CwOKUDXJfrEClFP9Q3mGTwu9yywPVJA=;
        b=GTPYyqPLkw8HBs4jHZi5Ez43/SEFcR76tMrud19Es1U5AH8v9PBsQPKjRNzpUhsDb/
         cmHTYCHeFE1jz5LRnM/eYx6SxgTipSM9RMSxvf8vecoemZ6cMwUpZjrSzDwR8frHEjiA
         fUVd0NLDqDvmXbT9cJRGURaYHFiFz4p4R8GrHUbcuRjiDf7n0tuQghaicLB7DckQc6bW
         VNDPJxfXOFG4OGytpM8d3Nn7XZGLRaouOraYhuPG0S2U4zL8ZS1KnTrhrZmRTWCSkY/7
         b10UAZS8KfbWWg33lkeKOBuB93lHEl4cr64lsJFJIkAH7+87oaj279hIU/5x1tH81igR
         QlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092426; x=1790697226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+J89754OJs4CwOKUDXJfrEClFP9Q3mGTwu9yywPVJA=;
        b=bCMYIf7vs5fszGgJkEMDIMYWP6hNuk4PcKhBV3VzDbcap4VKk0ZH6bax3+X80KIT7f
         GuICJ7vdFg+pTX7aPQWU9Emt+ycpYaixzJBrI8f4Og889WG9P2atqj0+HGFn3342LS1v
         iTbPjdka6zBgmprg8/jxWQLVgXwoTZCIOmT4KW7FzLnHzJ4U5tQUycRQS+ZF96zrHJe/
         8DOlhvBGvcuxhIy3irZacH9V99SIAzznERUUCEKYiFQyu4b8QJhozMHA3pEq2nnj5/9q
         FUcwA6dIPiPUTk9uJLFz+LmaJMsSpJKdsWigAYxGxtUMePvsJbVBay10EZMDQxC8EgIi
         uneQ==
X-Forwarded-Encrypted: i=1; AKwUvByzxDH/SmW0Gy17ywmWiKioH8+J4sRteE8lC3iTfcn/VZC69+xFlsxHMw9/V535Ftll3XM=@lists.linux.dev
X-Gm-Message-State: AFuF++kT5HhjaXkun6DrvfhcgyIknu64Xq5kkuxjBvn6CWwfqpL0B/py
	0t3G1QFAcCvmpGHRsQNaXwrfhw/4JE1OEdVGQfZI+bGIisA+FVb2Py4U6byk3CDCxWfCKSMQeLm
	0nX6mTE8qF3pLF+Nq7/l464gmzpXlT7OLdqnIdtRQ4dcs11z45rs4PFI=
X-Gm-Gg: AYBFou20NLzF1Nxq96v4sj+R34PPUqm7jGtO0UeOSca8xlCBwknxviz8DWdyTZRgcT8
	cq0A95vtUj6I8fcc2F3e+ih/zAkbuEYjgTOYLI1EDYVKpGVx1ivC0Fo28KHZ+vrFOnqt8cGKQby
	1bl/9zcjc4ywFdyYKs3u2l7YVMVY6DEhWEF/o+VzZzbCrzyBEt9bQtjGj3EQt5AxZlLd6soTR0n
	8rbeNwbdQox1fZ8msdyOAwcfrV4mHwe8hfcdyIV1477oUBY657k4sBNArETC21+V2xhYbihxGZA
	IqQWl1VScisVXg6fu+zMPfpWOZl+/0ga9IzCZl8WDYT/vpZRjcDVY2zEzPNut2ZZjEaZ9DNpklO
	awrnMqKGq0PCobsPbZAOvZw==
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6495485137.2.1790092426367;
        Tue, 22 Sep 2026 08:53:46 -0700 (PDT)
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6495425137.2.1790092425877;
        Tue, 22 Sep 2026 08:53:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5808dasm107428966b.23.2026.09.22.08.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:44 -0700 (PDT)
Message-ID: <578c26c4-a340-4158-aea8-40944a1067c2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:53:41 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay for Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
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
 <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aVg8EbXd33V_j4CUk2CFEVjI0DaBWByu
X-Proofpoint-GUID: aVg8EbXd33V_j4CUk2CFEVjI0DaBWByu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX6YCakU+9JWv5
 wXrv2AQPwOmQgbD5PY7cvTycWR5psXM4Wf+Z2hRjeW8a34VvtCRDC6B5YHSV15MSJ70FhIjWdBy
 Co6nu17sdUQBGfmR7WGg+/91SBeRIBM=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2a48b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfXwjT7JujuFEpk
 naYK04VRzpp+FoePbnEZhytXqgtE6TuzQEwuLawVZeTV9s8Q5lynJJgVs0anGPuZw1mruetc/XE
 1+m0KH5bluOk05h+gRcdl7jdxaPzvXnymsoDyzTmwD/IirBCds0iloFzO4X/hSGCuFlbNNtXYJn
 I6PZ0g+F7LaleQdAoi9j9TyIlQgfy5Rd2uRZhrBmN0VBoEU7eyKa4aisgKHKqnz8m2vc6jUd/DB
 oTBu/XUAbsiLXthCxeCmud1MU/lZhONJOJQ/TtctKu6ZsepLiA0vCUTsC19ZhlW1xsKx1tYWONX
 gSJD2mQAZB7yxbdSalN5ooKTMBgrxZZRDdqzVlr4Yz7UQRki9EO2B36YltAuGtifPBWYwkdGHee
 RhGCur/35B7Bp8mmozfjxXggWO/oh1zWzak2NbJP4XICHkp8x1FK/WhvsCMvfQqX/Xb+GfGRGZc
 SR+KA7TQmkX4OEzD4wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm8150_l11>;
> +	vdd-csiphy-1p8-supply = <&pm8150_l12>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};

Likewise

Konrad
