Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C934753B
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227260; cv=none; b=UW8dzoe4I7SlAZ7smzXR/7Sq3EYF6CwOHYXi4HdQjU2nHDeFZiXAwUjXo5Wcj+MSeR/9asjQofqeAfikjORbfNwd3+I1e0OtgLzZNmawhbL2soV0dPwkrwxVq3e0MLyUS0fhR2kGpNjDlVE9jm1tg2L03ZmwJoWp/tu6Op+CRsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227260; c=relaxed/simple;
	bh=hqDimrSMzepFthCtzmR0fJb6vVYY2mFGikCgt7E7+tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0Y62Fzomuruojh8dFZhprnj64jKFBuqkyuSNSRsK5Ww4vuQjr0/kAEq8GakuRcJ5Wo96D7vc30FPVIZ0K4zWp8kz0VLiBKzbuWviI25UPMBqozHKqwHhp6IM0Z5q9Q0CYzkCWcHLfooCGQLL1N2N0a1n/q3HlAWhS9e5lqJEGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dN9Z3Axb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4CGQ/BP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dN9Z3Axb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4CGQ/BP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6337GXfA2707221
	for <imx@lists.linux.dev>; Fri, 3 Apr 2026 14:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=; b=dN9Z3Axb9sGFmQtw
	rf+NadN5/VRs/kJn8urz3yGOUOUhudfMs5jkbsE1clbjQSRHMm3PpSy37bPqUgc1
	MzV6Y5mzGG0mBEfQDwLJW3DF79M9nsdKcEoNnlU03gkF5ky5Zg5YnZGgoHPtDtV6
	mXt1CgaSZbRcmUq4E6/DawKrOwX6o6rFaKcxzCHLI/CsvIj0CfIRbZtPbjMg92lp
	eIg2AUiNfzptKPjtj7pqEdOQ+FAaK3SGcxNwR9pJZFxkapkvY2w9hyxqKlJOg8P7
	nvDuOX/1jtr44icwP4p5XKCCpYB7qnDm5d9jXnyXaEWLDYAQCTDFIr+LZSJgh3wk
	doRHwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjjsbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Apr 2026 14:40:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so92120951cf.0
        for <imx@lists.linux.dev>; Fri, 03 Apr 2026 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775227257; x=1775832057; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=;
        b=K4CGQ/BP2hkkpwTbhuSmR+A+RdbuoLv8H20pKEK0Yfd6Ms5n3ZvHa7ZoGY6Hughv0v
         hRJnBZtbSBv6sjoySsbU/8p2C+32f3FxT/x61j9cEoqsLtQJWfyzT3kQ2dGifHHUUSXs
         dpF2Jgg/e4D4txqm2OdmRcPBBGRD4lpfxO3qG++GnQYi2fz9OYoU0V4OnPSUCPc5vdk3
         VQWdxwOgfS7oPutFF96v1YbyWGlrntmH9mqr5obXpoxxXH6h9dH3NlHShqNIzztJ6sUr
         eY56c5KydvkRVzSiC7XZFuej/TxddL/R5+NYACcnHHd3gyVg4ikiIeLM1Vm2h8cPk7+q
         7B+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227257; x=1775832057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=;
        b=Z+ndq1Fpy+kBPBiSd38tKJ6kPml4TxLfv/ZWWytfoYHIFYQAfNL25nPi6sYjW3cTR8
         acKsf0SbCJc9ke+ziCmQPorhkUFc86UXDpz6Tee94pdH9tEywfPE2X5EmCryGegqhwjW
         gzVQAF6WajSNTb5v2QrP4mDPdEnvbbPtnh48m7WIdtcmiMZ5kb/N5l267rd29HOy1ZUs
         GNqTvRg1bTqtWTsbK2VxMZR4DKIdw2Pbaf1prOGYl5L2EOJ/Ckm2pn5pHUz+pyUIQ11E
         BYl9iP+ib4349z/xpNY3CkgkmFawrqVYyUWxvdIQO65Tp6HpmHl4gWuw0Gi4fXgPdlke
         LHdA==
X-Forwarded-Encrypted: i=1; AJvYcCWHnBanXNfIZLmibjjtnRXD2cjPuGe53CEThCZ0x8/h/x+B9ZYD2sGpoygvu1WWGUIokR4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH6YhYmqwTWyPCewkkeWEdGCx7ztYvVeRDq5ZKxGmvFkvVUkda
	64Iu9qI4kEhfCTgdcq0FcaBrMrFj+dBbXzHLz4lJKJJT8g1Mc6o4fV/TsSgFts4PSiQOL/vGFxU
	uESfzclRGB96kREIC5DOQ8wJ8I4fzj8x/6IQBLyOx/FhX3g+dckkdMOs=
X-Gm-Gg: ATEYQzycvL6RBvPBhKmNtAY4vT8ioB7s3GjUyYExNV69N0mP/+mWS5xH2qFbtH+Bpf6
	gHiDw26gL1SJtp/QEHKc0DrD6pr/oHNZyOCavKLvsUgYbkhbnfPv7T/dMimM+b0GbhQOnnrW27f
	bF0WpPoorJyd7K9K833CyTp3jx9RJgxOgV/cXP6W0lmTgE2atBg8xcNMyuQpyM2ZeQjOOXQ4/zz
	qQNVptRjFdylRgImZQrZsgZMwL6FKf3nGNOGR9C7RzUThFQJpGbDqjpNKeilCHSWOf/UKCf+5xH
	tQ0Das4GURpt66BWx+hvB6D2yf5HzSoLPbRtzAxRItjJbDnqFqN0xdCko1eYSAJPWIzUA30WsOV
	PcW/sEtynVw6z+1W7LLObj0OfLZSxKarp160gK/ap4VeyiyDMge+iFDaaR6b5xZv0hshsau3EIr
	5QdcDjLZpe
X-Received: by 2002:a05:622a:986:b0:50b:3c78:de09 with SMTP id d75a77b69052e-50d62a3dd40mr46478541cf.34.1775227257342;
        Fri, 03 Apr 2026 07:40:57 -0700 (PDT)
X-Received: by 2002:a05:622a:986:b0:50b:3c78:de09 with SMTP id d75a77b69052e-50d62a3dd40mr46478051cf.34.1775227256925;
        Fri, 03 Apr 2026 07:40:56 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488981de7fesm22558685e9.9.2026.04.03.07.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 07:40:56 -0700 (PDT)
Message-ID: <8c548166-af30-4b5b-be2b-15199322d343@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 16:40:54 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible string
 fsl,imx25-epit
To: Mark Brown <broonie@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
 <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
 <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
 <3ba9e33e-8d58-469c-9c21-5861c0f6c5eb@sirena.org.uk>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <3ba9e33e-8d58-469c-9c21-5861c0f6c5eb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AbUEx7n05ouhMQhEL7i95G0mVVgRKCbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEzMSBTYWx0ZWRfX/elXOA6VfOEx
 kiwKEfHy7kwoly8Oupzme419X0SrY87uK8AHtP6hVNGkXqMT25L2BYY8+QSD5knGvt3ee9jD9sX
 BEx+EtTLQeTTvykmNhLM5yUm03hkosGjmj17z6Ip7CYBk3WKkY6/cYJ0WAEcErZAoh8Qp+l3Glh
 gJvyFs7aNSwMtQDdss5jFyWVfh02WdO7TwzxICAcdpqr/cKOYjcPx6b7Tr4YcXkrmN93iYvQKZb
 inhGVe3cvk12ZAvd0COvBMFlyVYr13yJTa5fnUKQb9HqyMUj48EMrIkkNZS7617fICxJBz6tFFb
 bSxOF6xqFFISNTq+5q96k4XigLrd6YJ/+zGCb+d4kBHuYhmv6B+byiB5h8Etjor+xVKw95n2Fam
 aUjvspr1mYKtQBhIfmtLoIFfdB+OUZY4bu119Z5WKkZOtaHZOBHkC548p2TKJYKcG2mMrWDOMM3
 N9I1AERiQxJxGGMV3BA==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cfd17a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pdw9z0OCORkzPJei4WQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: AbUEx7n05ouhMQhEL7i95G0mVVgRKCbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030131

On 4/3/26 13:43, Mark Brown wrote:
> On Fri, Apr 03, 2026 at 10:15:49AM +0200, Daniel Lezcano wrote:
>> On 4/3/26 10:00, Frank Li wrote:
> 
>>> Can't find it at linux-next master branch, anything wrong!
> 
>> The patch is in timer/next but may be linux-next disabled my branch
> 
> I have a timers/drivers/next branch in your git tree in -next but
> no record of anything else.  That branch was last updated on January
> 20th.  If you want something else adding let me know.

No it is ok, I had a confusion in my branches. I updated the wrong one. 
Now it is fixed.

Thanks
