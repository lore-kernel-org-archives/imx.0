Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E933BD237
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508435; cv=none; b=kHhZMJtIj0WY91Ho/jVYSX90Ib8aWiaL67E32JnCneWyQSEPx27rqcXLq+p7sfWmKXvIQOPHy829LbhEuPXCmvyXdDS1ZhxIlcRx1DdXNDmomX1DM9F9DIoDJf7/CC2TEoc03+Fe8/ZY3/WBbRiNEn35YhXGZW35wBc3M/rG8PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508435; c=relaxed/simple;
	bh=pu5aKp2dBY9Z7bUFYMTRFGkF7Auzc9XTr1kXTHyu/yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGRilqFIR8I2yH9yZaoVrUhg3DapGgknSlHFfNl7YZ29R2Nj9xcbcLJDoq12KJc7KVfRqs1X9AqLTpO+v2eVePtUKqRsnnaZsC0Ah/nSiCNFZ3GpCTzXsrp7duq7OS0oNMGxNZzSls4CNgFlSLkYge8oNdQDxlnGc6P/BKlW40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eElLavAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExA4GaA+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eElLavAq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExA4GaA+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KwsS3888439
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=; b=eElLavAqty18WPNi
	akQ78LNkjS1KxXRN/LcVTT5t5wPm/l36I16VVcthNtebm+bPUaEK9t15p8plA2bD
	R+HvKJNLEAE1pNlOCGEjdMT98sV8Q1COUBZHwz6rz65MwV1NInGBJIlfs8aF5gbr
	zfd/b/hWYOjSSTNJDoGJHZ/pHHnfwCZ/KeHT6l81oMWbC4jhmW7E/+gzRRLer3UE
	592gLtW6W2UgRqgBcnie2KBts4aiVgZX7NE+BtbLh/f3AvfsEkYyu5OHwnl6HQXH
	m13TusyKegmMK+/Hj1xXXPguNjjSIUvLEp2jgScNmkSJp74M3Zb8NWGmG3TskK8M
	kJPhTg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wx6gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:27:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c857ebbb0easo2218187a12.1
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781508432; x=1782113232; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=;
        b=ExA4GaA+4+ntjHy9pwWkfVGtZYtQDvVedrxM+X1I08S2m77S54CAW5MtUlAUTRJDUi
         FCauTl+T3NUBPD7X7TuOSyM5hfMtrE0AgrVW+1u9RGHHt+FSWL+FkwJGKClxLs4wOJZP
         QdX/9R7wtzDCmalSEx5rjU7LLV0TAN0rmgjueQPTp+BmxtaozXDI966y5VZ83DXEztpJ
         ukRrBTSVj6+QGToCiNs4iz7tCUeyQTIyN6JhsZtyecHYyPfje4wZ0ez5QHPWPx1IgYwW
         jRQ++/ysk0iyvKFRR3Tvd5X+6H0yWuK63JtOpE9QPy2+EZGvOCSnaBGDHgwh1X5AXCnn
         IxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508432; x=1782113232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=;
        b=NfdejAQt8jelixpNgfYURm8ZNuET2AkDNXOkYoKL0Az8HwgPbAOFPSsY+Frb2zeCgo
         2CkvGNYfYRX+cmq9qxXkrM3e4nTCNF6N6j/8DSfQIH1QGHbsho1RZebLIaVpCdlf9h2v
         uRJo3vx4bDvCEda32dFNeUkOTiByBgAtJ3FDzSH+qFyeZtvxGGDrjSz0tEDqgUEgKgOi
         9CpHhTKBboyWQoZomxFjZNwcUymXlXVBokLRn/30qn4C6PU2GqWjCC04vzTHSBfhYwvo
         +ydcZHPhO4PzwQcwfEiWQNptLQugf1DVYs+lm6Dr857CKX2FpSSt3EGsXvv6G4AeUoQ7
         Iuyg==
X-Forwarded-Encrypted: i=1; AFNElJ/pJJGKe/k7Z9RK0SJ2/IImgQKpywP7x3IeHmb2qUOOAtllhPo1Tp4Cvahs9wbVbcGtsj4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8kr5zom88MtkvemFE9/BSFro3EuIADjMXql7tFaaFyDIktq97
	YYwAiG8js1l/ey6wUL56WOkRT4ZLhBDQ01lru1w9tQG/BEqJHT+U11wlhCgiqKWs2T1211Dgjxa
	bpmo0f7lf23NgCzPmWZ7mlHoZRstKZDfw417I6fYQikVS/qiAckHRC5E=
X-Gm-Gg: Acq92OENZvKRUhvY7JNoTY9iJbQ3G2VgqtBZbhX0VLjfNJoh4a0Ykd12P9yQzJGX1Cf
	UtmBqKlcTebxWxPfIy4jhPV6QLtg4iYFrxLGZuuixCA99AxHglbMzj3O+wGdRVK5CT8sfT/AgCE
	rAAMj7qTXLfW6P0/XDhus5vvObSzJKlkiDobFUXVN9ADw/5AQYHLrzVaagOZz2ZiptExuxcIyJ/
	iPYATdIOZKY823qlmQ2C0Uetey3KAZev2j6RYjToKXmr9bKbIJAaoaE/2ixBBZ5/tVtKUJbNSUw
	SdQ8kSXhHPrurvK6JiCDiRZMt0Kr9BnQFI/UiFDZ0u+KCUN566A2N2cU5xq16x4OrWjHzDpqaEH
	EKlg7iml/fXUDlX3+tPUqJcjWRJvBEty+tpSqSQVcumDafwnz2w==
X-Received: by 2002:a05:6a20:e290:b0:3b3:bf9c:7c3b with SMTP id adf61e73a8af0-3b780ec2f0dmr12418318637.8.1781508432274;
        Mon, 15 Jun 2026 00:27:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:e290:b0:3b3:bf9c:7c3b with SMTP id adf61e73a8af0-3b780ec2f0dmr12418274637.8.1781508431779;
        Mon, 15 Jun 2026 00:27:11 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651af0edsm7787406a12.32.2026.06.15.00.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 00:27:11 -0700 (PDT)
Message-ID: <b11a9de2-6bc6-4345-8d81-5befb2182a7d@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:57:02 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
To: Bryan O'Donoghue <bod@kernel.org>,
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aCYzxNX10mhG6oaMYKGtFLBytW_A2_0I
X-Proofpoint-GUID: aCYzxNX10mhG6oaMYKGtFLBytW_A2_0I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NSBTYWx0ZWRfX+zwocxyZN+t/
 TyrEOCKEpmyZVdqJuBs5K4m3DZ0nAkpqXIILVBWyfusuAjZs5pM5Mk+wjpLLRGETRjdrOQVy1YB
 L0BLl+EKcaIfE50O7JVnmtlKVxIrpwg=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fa951 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6rJd4luAlhGbPPINhpk/8Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EF_2yGccovn9CQtFCckA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NSBTYWx0ZWRfX0JPoa1Gu2PA5
 AzQ3H9+AjhRHXXPNfc1IfO4C1KjIQFge12tS5injs/OYt3d9DPytNH5LsFRGq7ZxE3vwYTnm5Me
 HFI+xFCn8M31Uo13OUlG/D3GX3QzdwBu++Wk2bgVdgFhbB/w2fm7TBeKKYxtsAAJ6D1EPp8xnw5
 6VDcP00HmQinBYWfaRUCfG3EqRk3f3LNiIGjZa3JATtQwAXnsZjUl3C5uCyv0oDuWNyPkD900+Y
 sv8Zz3o9Uc/CsNoYfG14r1JZnwyzRVn79gSH0ycsPuVmx8/dUjKv8ciJpMI5Du0KfjifbuxW4rm
 ACUyTqtqQy0CotE0/of+JzDJ/RiKeSVxBK+Yfop07Zw1ST98DYjZsZQYoOEL/BbAYCYkZcRUkIc
 3BJVCcUMiu7704D0cxs/Dv0lEM+4NyxrOn7zuJuvnVpHY18blpD/KblRipJtQPg4APta572zp0D
 /X2/il7iQgGZ5XPJ/ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150075



On 15-06-2026 12:42, Nihal Kumar Gupta wrote:
> - Add blank line between iommus and power-domains in CAMSS node (Vladimir)
> - Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
> - Move cam1_reset_default pinctrl state from board .dts files into the
>   mezzanine .dtso overlay files (Vladimir)
> - Collect Reviewed-by tags
> - Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Hi Vladimir,

Apologies, I had tested the changes with data-lanes = <1 2 3 4> 
but mistakenly removed them before sending. Will fix and send v4.

I've incorporated other comments.
--
Regards,
Nihal Kumar Gupta
