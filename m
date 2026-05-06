Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD847ECE2
	for <imx@lists.linux.dev>; Wed,  6 May 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084261; cv=none; b=SlXBOVwS1HN66WGxR+HKUpiBx/pDkBM0WJbnand5X/+X3P8TWYKR63Kze0M2DDga1Jv85NXPlEvh8jeFZa6qbq9uKct48ASE4SzlPh8JQqBM8IJfwwlfHFeU/0H/rwCIAHYyXhNu4Poq5LdrvmHQ79RI5ulxlQuFU6amgM8GfrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084261; c=relaxed/simple;
	bh=k8mdGwOI45VMWhAk3cO2z+9fxW9u1DI+6A8LfvpUqic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ut2Td5ntO+v4wqpzqTThBIcRDiARxKANyyZDp6xYCtRF+loO8ZmQsYWWMgenR4c2yBp3Yts+48uIXaBx+AtTsGuWYemldlGZw8wZShGEClJ+cNYfq42hZ3l/hPAeSI7Ztz47iN9JITyh5uya0LtRuH679XdAt82awi/NbSMBtCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4hebraP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBlDrVtM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4hebraP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBlDrVtM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3V5l1953117
	for <imx@lists.linux.dev>; Wed, 6 May 2026 16:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=; b=f4hebraPSXWso2xB
	ZVPODWHYJbqc3TcCB42zbDmh25VHSdrAzg8ksAJxrehsSfknt8AJiTyZlX2fQc2I
	RrIWQz+LLUrdBF/iEkdFr1oas3qykbOLqYaYEqFEOGxofcMzbDduREJH9y8gkmhb
	EFj2lNsg1jiKixua3ZCuwkin7hPgn89sbV1uMqspGI1Kr+RliKkx8eYOuGTOisbA
	Re2F/bnXgehXejg1JUoKj8DrOxLdVjotiBCBnLG+/7cTVo5nh6GVdZaEAz0nzNMO
	+oYBELy/9yLHek0rBE/FVICz1PsvlXge5e+KYvwb4d22kiAQacqe0mC3Za8j8RmA
	H62Dsg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc1dp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 06 May 2026 16:17:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-57539ff73cbso3282690e0c.0
        for <imx@lists.linux.dev>; Wed, 06 May 2026 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778084258; x=1778689058; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=;
        b=NBlDrVtM34bCblNPmuLDr7pprOoYNG/J6NFdow8bBjaGua3/UMZTvQ/Yny4hyyBOHs
         Imomu73J5b0fweMxjX7uIiMhQzqMcA0quOkuYRLBAtsscQ51SDz/SQCzgJ+Z/v+gMP58
         xB4RODs3VaCJ9hq9f6+E/54qpmz8Mea7mzze20ZSeA0n+9dLYKGUpstsepNxRuvO39Sr
         wtbUy8cMd5FrpwDqKkyufjI4AnbdELVoHD+CV9lLGtgodRwcCvWbLD/kAn92Kcrgs5jR
         pnfqxlNjAnhjDChgYAvGSw8oCMs3Fft9qUBV1jZLCbIIE0O6hIXTtfNoXDBa9m7tuBDX
         YQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084258; x=1778689058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=;
        b=jEk6cOEqk19k4t5F6ZSe1EzpMXH3EPr7a1widYnjSc6UKy/1lwiW6G99L7d+k1yIEY
         7/DMzQXd8opPVAu7Hm48hi2VGBWswpGt45sVUGALEOnagzLX2h419hGDhVNAaJuCA7He
         7g3x51DZBJwHY/zShJYOqtYxjIZBNOWSvwxkRu+z7z1L6pI4DM/AaVDcmnCeoxmwzUYY
         vB7CQlchajhoJeyJ4l17esjACcXOU+fmTK6GWCudU/yvllVv6hCSKogwC9eQ2arLvVq4
         /rJn8bxT3HUUUjgNdKUe0s2UtWmParBfp7ZG1fiLnCKFY2ohLesMvob1jWVgEhCaZMlR
         lDEA==
X-Forwarded-Encrypted: i=1; AFNElJ86gHI3fRPiLP/NnvAIqf1Dy0FlFrruMcD7PmmXQHWJKgB5cRfvCmn2vPWZYRdoWkYoso8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzM5pPLgpVC+YgtsNR9QxIannWGMnfAy1mlaV/DlE4/EVB7is7N
	J0oYxndnkZUF7MxlwbFQl2BpaXBhu6srpmDX2VaK7z+KwOb//WUyC5e9oBV5DZOPwWk/x1bsh/D
	haEJJR8WR5zf7RTxdPlmEm9cTviBnuXVMwGgN/rC1VjCIHpqGEoAgcxM=
X-Gm-Gg: AeBDietEs6peCNkZux7zt20uD0nZjWIJygT3SDK1vGu2CrVcEk300I7qk0Fee3VAA61
	B6RoTCE80zR+n4NfKcCQOVV/ZmNgbcvES1S8ISoLJco6C59qrrWT7V549YapLtwukLTPcBoWRZs
	bqY2L4g9NlfFANxGtpFkq0CztMINPzj5dFMi6g7PeNdUZLYhp1fGx/gRNehJlaQfvKpXySBPPWM
	vTs10xWsotWjRJDc/18kSLVp2qu3oTodpspYB+rhUn5E2ga6Or7+4EBd6zupFkvAEnlpOR29N7Y
	kNNvdySR2B8nrEBFgFspbMIgoxWkzsrjTpP23Bu3FNlrHp2WBV3esvosnJSPovVB0SCgJd8YJch
	Er63Wc0FfL5ahO06w1TKLNfr24Oss3ZUfE5r+hGGcneu9iiJGV4xwMDgq3zGSyZuSdkq1AV88D/
	8qbtILVSrjMBZRf9kRAf8=
X-Received: by 2002:a05:6122:8106:b0:56f:b831:909c with SMTP id 71dfb90a1353d-57544474e1emr3810509e0c.1.1778084257937;
        Wed, 06 May 2026 09:17:37 -0700 (PDT)
X-Received: by 2002:a05:6122:8106:b0:56f:b831:909c with SMTP id 71dfb90a1353d-57544474e1emr3810491e0c.1.1778084257512;
        Wed, 06 May 2026 09:17:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm95223275e9.1.2026.05.06.09.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:17:36 -0700 (PDT)
Message-ID: <2e9dd9fc-a42b-40ea-8393-3bf66955c4f2@oss.qualcomm.com>
Date: Wed, 6 May 2026 18:17:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] thermal: qoriq: add i.MX93 tmu support
To: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li <Frank.Li@nxp.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, Alice Guo <alice.guo@nxp.com>
References: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
 <20260430-imx93_tmu-v6-2-485459d7b54f@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260430-imx93_tmu-v6-2-485459d7b54f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1OSBTYWx0ZWRfX/2jzTw9rFeAO
 rqudE3/BqfXUHnOzOoE8opBTLez8q3DyOpoAlk/Rwr7WaSTAQ2UnLiBztR4bKOO6PyQ2UaelLGQ
 8q+c96+JS7CcRc4XyQwvwJ+NhZf22aA1Oh05zfLwOdI9D7evcIX9A0vyhOh+FuIgQq+vV0KxCEk
 OIe/KpktxZlRLKM85U+P2aUj5oE35qss8xoty2+nyRVlWEIs+063a2t3hu+7Gp6D3Wf48mBhskR
 0axUoTLvqfT2RtxwmoHTPjqieyFecWmOgxjDSP2/e0yUfd9Ydn1TU64DJHxc1ek9lj4p6O+Bcqt
 z3q1CI2zz8OspHX0DUfTyizaUClFReV5em41ZKmNFn8FiPKt5XcFokNJy0eZCRsO+AbWwwbThSz
 T8tA9TI/WibeUI+9wJBAXZh287UBZ2c95Gn+OzumXWoyfffR/SlDzj/hb8VmcUapk5HIqq0oqsR
 eukLA0QUXKkCILDW+lQ==
X-Proofpoint-ORIG-GUID: tLXUmzkEhidIy3f9rAP6DhiIdtWmaN_g
X-Proofpoint-GUID: tLXUmzkEhidIy3f9rAP6DhiIdtWmaN_g
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb69a2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=8AirrxEcAAAA:8
 a=_0vOcDHEFh9t5MRidCsA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060159

On 4/30/26 04:53, Jacky Bai wrote:
> For Thermal monitor unit(TMU) used on i.MX93, the HW revision info read
> from the ID register is the same the one used on some of the QorIQ
> platform, but the config has some slight differance. Add i.MX93 compatible
> string and corresponding code for it.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---

[ ... ]

> +	data->drvdata = of_device_get_match_data(&pdev->dev);
> +	if (!data->drvdata)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get match data\n");

I'm not sure testing the return value is something very accurate because 
it is like the code is testing itself as everything is self-encapsulated 
in the driver.

> +

[ ... ]

>   static const struct of_device_id qoriq_tmu_match[] = {
> -	{ .compatible = "fsl,qoriq-tmu", },
> -	{ .compatible = "fsl,imx8mq-tmu", },
> +	{ .compatible = "fsl,qoriq-tmu", .data = &qoriq_tmu_data },
> +	{ .compatible = "fsl,imx8mq-tmu", .data = &imx8mq_tmu_data },
> +	{ .compatible = "fsl,imx93-tmu", .data = &imx93_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, qoriq_tmu_match);



