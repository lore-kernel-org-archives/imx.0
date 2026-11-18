Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003835;
	b=PXVOZ6TVbQD/KYdVFtdY6PlO50VCGYn/c3x2E2sEe32G3lkhSSFOczssE1rcdcM40NgL
	 M9RhUXqXklg85q/O/5jjkCQMrBvPW7J8yBO2PxEnzL2qbjHeymDgFxXxncuXbNfsXj3Lr
	 BjoW4DFWtjHhN+mZE1jfn1kXhJQd6l1z4z/z9C/XwOFJP4tO8+PnEGW88OdTDchxcN8NM
	 NreebwUViAVaSVw0bA9Pa/VFyY0iNCczGOJ2gvzU5triSJy1YBNmKCH47+Vb3nnWV64AT
	 G0yTpPMDFKJND9NtYx02soM9NRGBn96rP/32xuAQ+zlyWNoUF+DsbL1BVp2mAeSCBQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
	b=WTMgiHfayEl4nXV+tBUI+8+QUp9yR/y00ByLa1WH6rcAbkld4pDRA9rt7JDe6MRC+Mt5
	 h2Nu/lh7DVutwLU9hvHB6q0zQaWV8gzVusEQ8jSC0+VIvjF+xy8lWI6nVnKnxKfSBlcnK
	 Hr6Gj+KGBk2n129vQ/7u/9UL5PsvAMJ6uN2JGkRolc1zZk/yrNBZ66PkqKj2QvkhtWPwf
	 1GQMY+hYDoMNdWSZfDKi/FYqo+SHontPtEsgB17MXiZwv00ifDmNd4EFetfHmLH9wg4Wu
	 UCJ0uXqFgBeqwnj9KEWuGqEy008uQBy52iQqD6h9p5hNq6vrfP6ZRPhb2soXLe6GfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7SVckrU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BvWQeN6U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF0606A32C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 12:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DF0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7SVckrU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BvWQeN6U
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkqcb3624647
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 12:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=; b=g7SVckrU+lSN7YUl
	hx77qvMUjExSw1YFXAMgAjwwKky3QRqTzg6hL9K4pmLl86PqSxL1SQWFgA+9otUy
	sipuafSdbdphZEkzA0h3f6X4bIsbPL1xCf+blh9+jaT2K691qdFuMLQ5cRmAV3JJ
	6mU0qjgVluFtpL5+v6FIJ3t2H193ky9UC4eIXZxJRN8K36qKXFd7uq2N5RA2wcol
	20cw8raBGWOxXYs6Fs1Gw0aT1QjsXmUoGZrqXe5otjj5GzCQ1EciYxJ6MJk0y8uK
	J0NjR3d3qSUo2QQ+BEMYg9h+lvL99eilKQSV1f4PApOg5GqOoCFxD5pG96zPWoyQ
	JlPkVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatxs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 12:10:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55ca6405c20so30200781cf.1
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003833; x=1795608633; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
        b=BvWQeN6UYAjg8H2J818+ni6JIOOJ8JEqGJXlBWw2+rw6sMlhC5pdaCiufWkFw7oqek
         L4p5i6kpAww0aLJJv2vK7uMZfUvSm3NwG3bYF+rc+NWnf56dqVoCN/xRREuTipUdBm8h
         XupVE7ShLNtavnIKHXJy1OqDsRDVzUMWDqY8bVLQX5K5MsEGyipjxsQoQF2YI5vL9T0z
         VnPO5JDoEsWQxafhhAu+rtBBM1e7fDPSGnCT2E5kLeZPIIG2UORC6p7R7N4zWGDMSmd4
         xkyHPlrFqQvLje5Fx0igPo1bWoNT+hhGqeB6HJ9mx6ttRRHvB5Ii9iss6NgpaKISz05L
         qZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003833; x=1795608633;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
        b=Cw7P//Bt+LU0Dk1bXoVsXXN8hEEeITpOPMPmaVfcpP+wTw+clZNFi9vS1eITVs3m7j
         CZAwJlL2Eosk8o7IKCbPB4zWwNoiWerqII6wuCSc+rz6s+4algAP3UGqVWpYCJ8jNQeV
         gFVSJ///P+T+VmrG6lRGEG5nOdtucrn0MeiVmSBsOK5rIiwtpZxVXsnCqma/gXfJFD+4
         N2XXDyNt/gMabrXkyxVCgnTwo7Qd7Dpwy8NQNteJRXM40chKk1YvyK0xy93Xfd+qqmfN
         KxHdFGkqN1NtpWCeAlTvwB9Ges07eUmHgdgesAzdG87vTHgXjHRNUJg1X9JQjnT5gFit
         c0jA==
X-Forwarded-Encrypted: i=1; AL+hErEWqW/TFzz4A/d5FWpDniGJmOO98MPzrKTuRtcxBJDShqokDvRpjCIoQVLd8Kfqcb1koFE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+gnt4Mm/k3wlPiCd2sxQ4ISjF8AoLIfOwhpE3OsFWvsUVnHXID
	dudj73CjxbywbjRzjACA71P/wTBPNLLvII/14IZxcOeVQTzlI3oONTSko0zYtT6I0Vt7G30W5j4
	FdxQGSx0pcIS9zevghUBn7cUGc8CoMtdjx12w/PwRczmqXshRIQ49ntB4SWBfc1k=
X-Gm-Gg: AYBFou2rABpZEEkDGXoUf9JOkEYGXZxNQZfp/Tmw5VJ5cgbVSvXaXYI5L5WZLvnRvhd
	zkwOdMLRQuEJtJuYG9TFDNOXDaF/pZckH93fjXej76D1CLzCi/qBFQuGO+olxhfu2aPLaI8CoiZ
	t9gShCa0YtLCVdBXPQniUaB4QRID0OoNVLhTjVdlDxNxFzqk1fs3wDEsmwsGdokSoFk+/deVm7H
	uKHq7r9gHUXVZd5cZmqQBSMi/XdQGbMAG0MQPA56NqYba5wb2HwJej2F0uREEy4y+5PYWHAlBXA
	5FDFGzeNRQG08y+vtzhAQgRZoRjZvEDuqhrqhxril+xfg0VuNW9YRNJBfGoxzU0xRParK84vULV
	q79I8uew0lJj14RlYIlNkxdELMZn9+Q/6SFkgVIvpHCxGmtIh/0aokYCC4iv54149reFlqkegUU
	w=
X-Received: by 2002:a05:622a:5c16:b0:536:540f:2ac with SMTP id d75a77b69052e-55d495308c3mr80959891cf.32.1795003833399;
        Wed, 18 Nov 2026 04:10:33 -0800 (PST)
X-Received: by 2002:a05:622a:5c16:b0:536:540f:2ac with SMTP id d75a77b69052e-55d495308c3mr80959421cf.32.1795003832861;
        Wed, 18 Nov 2026 04:10:32 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d001a64sm63826885e9.0.2026.11.18.04.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:10:32 -0800 (PST)
Message-ID: <c3082671-9d0d-4a29-9e05-17ae9d4ca997@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:10:30 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented,
 unapproved aliases
To: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
        devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218903@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-218903@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd95ba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=nKi3LhNZ2G6YK9Nm_qEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wUB13tDKxR2NxMx1cEq1H19cnAgv5AW7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXxzOAtLWYZ/11
 FbMafsd6RAybUrm4nvu7M/bTeYde2e51leWB4+G6n9XjqOqP6aev9JlRCKOlI+BcToLqW3btoIT
 XhcYAZT/AiZW1HfZg0OPo0KiiEpEDHTrik6rLTPtaNmDCLBNbkU3dIzGupqRE6qG6+88Bt3uqj8
 0jdUD6/K/4v4N/c0QA098tcSWxl79+vyYrz948I7fAiQ0vG4ynaMnWBTPwaw/Hbicn19xt1OmMi
 gprQGlJEcy2SKVk3cePQpoF5LK6w3Rqi4cmQu9NlE7WEJyjEMUOic6fJTnEOGzhldX9PrWMYnGQ
 ElKel8r/+YZTz/19Yo12uWwjld3ZA4LHP+5i2Bil+GJRb1bGtaBKGFvb2yRVbRT0PszRHFlQwOA
 /zwx0rNeKujBHfB66zKqZ/4mXqvt91dGm8UQDzZag4F9P/U9gSjF+p9vY9t04EmwYo1thvPhw/n
 YkpMNv14p/zAWEDiBmw==
X-Proofpoint-ORIG-GUID: wUB13tDKxR2NxMx1cEq1H19cnAgv5AW7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX9xAI9gRPxnrZ
 kY4Labw1xK1S6Vfsx1WGt6BL/EJpRWWH2TXXZZKwzRW1n8bpIbwO/pDMRN7kNCiidyML0tQOSyW
 cBrd8Oh9wMSxXzzedME3CcbMKbQ3K8E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048

On 17/11/2026 14:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: imx8q: removing vpu-core aliases breaks
>   vpu_core_probe()

That's intentional. Users should not add undocumented ABI and rely on that.

Best regards,
Krzysztof
