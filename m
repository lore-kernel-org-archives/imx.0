Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9323793DF
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704928; cv=none; b=rXn8JpbP7VIstUn6RfGExBnv6KZJzhf2n2n+drEJWIe8sfBuAZuLmwISRP3BKkeK2N+1XGKCGEPB6hth9Jc6g7/oO111n4cnSDogwZ+Jt/1wY+ZXbeU2MzrhopDCOCCFvi6vr5P3gU/KJKx5s9csLmOv/fExQ6cdbaUobz83acA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704928; c=relaxed/simple;
	bh=RXg2e8kwPtLqgu+p47pq1aAEIJDQlri2Z32TKUvQnFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBL91YJvJ3pidbbiqEa7gTWsZldHcgg1lGAVaXwxf4reXqQoV4qdb9AiL5nZTZOv0JUsZfD2XgUG+hxS6gaJoOfBut68KmcPlZUaEk+5oX8AeZLG4Ct6LrzoaimrOkIzJpCzV2wcXZkh7hTzp3lHhnppVEyrJFsoLNHG6BB29+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brmu9/RF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cna8ZjjS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brmu9/RF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cna8ZjjS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258rt3a1193205
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=; b=brmu9/RF7IkNb7vS
	GOOWrA/02uQjWusa50Vdsz0LLRigCGcb9iWdQqm4qkaE4wjH9aWdTeJQoGX8pXIF
	gWx6LSiox0Y/qsAci+Mdf0pfEhSE1ZGVd7tCWX/F04t7lWB5/o/mfuXEsavW1pqe
	wNr2rwDs3YQTcGEEYCbb+7lrMNk+7H5gzOPLRuBcjjto7wbzv9M8XZdcnZPekpfQ
	gFGwSz4oz0kGy8ZsK/RQJqRL85/JjoB8LL+6ufiEUZcEJSlMakUzDnXg8dVbq+lX
	6az8JKYOBUz+FKRyzEavLT5vMNSFnMJi6xILAaiuN1nYMi2n6aLamDcyl83ioOL3
	JHChSg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwgb20d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 10:02:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fbe67875so21982846d6.1
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704925; x=1773309725; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=cna8ZjjSd9+EaofazQGXVLCQ6W+kE2r+dvnP3um/qbMbyTZGudN5fP31VTtXSnT4/z
         qBmQiZnded5AcSQcxAX0ZDq4eIkgKQmz4kcRc8Prb5jLZV4vLeOVWViI8KdSbqL/CPnR
         xuw+CuNVWNf1FnSdUvD8AJtHH4kIQq4nKanX+/RVjJVRUSlsyIIodoXDP07SwkjoGt3m
         vNs8PCOf16l7sIcOeeK1rVO1tc8tVAvSoQBRcbiJMJ94rmI268YomCpSGqa5oKqwlzPR
         BROCWvPQpkHjHyLzfcttwiKLKCcnnZqvruPTAxHystfaVwLIg2GETar7fQSSnKv/ogQs
         I7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704925; x=1773309725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=TVr9slkvQYAFfZ8sLbd7bHtTmHLUNjUHoVHF66kEogqrXiUqkdz4pC7Jwssa+ZnyX2
         sDuwOSELu2TYiQOsQmc7jwyyH2SwyTFdki+ZleED3l2CD07nbOTiJiwwe9DYeuBXyQOE
         loIZEyevbGYUVjHHB6XNFGBklV63RUs4PQkZL2rxDGnv/x4pc6sPUUhWioe/Y3qO/4Am
         8GYF/i93ufI/DKJmNc3frQ6TCrqY4dWxaNGeq3bjSU7tAnVMeh17tnJ7gytUvlvI7LmI
         x8pnYDch7GAHTQxd87ErmwdPRr+T/LaZtDr6C6BawDB3VtkQqMvLnicSBNenodh0d3Jz
         JDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz57vVa7Wlo5szE86lmAV42Ptu0GbxdBN0MzI9iOaqTbRUDiRjJWl8dSUdom+LBvis3tY=@lists.linux.dev
X-Gm-Message-State: AOJu0YweBg8rQuxTQLyX4LKTG8XDICOPiGrZOPzWQGCfk8k3JeKd38a6
	KTqu94YGyep+rFm+UOWbaplWjHzKt0AsX0Du9WcopETn9pGwhtMQa4C60t6Kj6YN60Cr0ErB70Z
	uubUF6hBY0T0jN51jsrMPRuqM69oKl6vr3Oj+wdPNz1NhIqy/uCjWNx8=
X-Gm-Gg: ATEYQzxLYQ9Ww1VaspQnEhHd+9Rb39HK+nZvSDkC2gtVSaNpvwKdbauo/gUC+U4a5+7
	b9tVlAkBs3cL6TyGWq9F6t8vp3ljN8MI4eFK9fe/YEVxYw9jde2700IfkakI+Ibth4x3NQluOqR
	sAxitURa1cH0ibNBmRgxJ0JZmFwX9j9jrgDZ/xEwc4Zpi3/5HnY4MWRoLpLgO3ePElFzD9AwWRR
	Xvaw7oEGB+wx1Wy3uz/VCKHqi8b546WM3QoX0ShUWygqqaXMPjx5C0In5ccRgECeav4EgdkYFYy
	EMrrP9MAtGIfyNJms8nC3PyhwCeqVjb2CmTnB735APXkAp9J7OdUO68lOK7UswcL/FU6GOExwrP
	ISxH8J2QHI3gc2Z16lWENlQ1UssTNyCpvpdxvpcC9nXyFaHu4d0YKT9zqfIBym0l1o6dLS22cqv
	koje0=
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47022246d6.6.1772704925325;
        Thu, 05 Mar 2026 02:02:05 -0800 (PST)
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47021826d6.6.1772704924860;
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Message-ID: <24685144-c1bb-4084-80de-40989efbf4a1@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:01 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
 <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a9549d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RQncaQt55EiIgf5kr6IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: wvGW3qIIZjXekZma1s7BwX-zQNdK787U
X-Proofpoint-ORIG-GUID: wvGW3qIIZjXekZma1s7BwX-zQNdK787U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfX7hQtK8yAbBti
 PXJDz1JY01TGeyDkU9dTtZjnmgvF5iI8FSqVXvSEv1dGslJ1yz3DmIdfNGXo81avSeV8b3evmZm
 Rc71U0U8UWiuzo+NekX557HXHXeCFfLWY0BrOEevxJyPubp4vO8vrHNIsxWn2ZCR4IgVZFeTekg
 UtORH5PwRZCDz4ZxLrl2lSupTj58fDfEFePXcHoG9ixpAUV+igsq3Udz9lGQQ7CH8Q7z9274K5n
 4iYIu40sTLuhId5VJ/Q7QNFQ6oFWJ/ykSthZteQmHb+SvRSZLwajjclD+zqvck4FlrmjD/3qzNT
 D7a+qeh7Ns/1njf0N5n2DMYwLL5+Ep89+SVSAG4T8sqCfBADPtF3fiBzMNXSDlml+0806yUNa0+
 C7fLhI9ow0DMrh00OlaX9bWmjzf9FQE/DrA3KGhdA9YzMgjm2DZtej6YAJS9dx0JGbNulkN55uX
 NzQnx/hZQc7EuhCbwdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080

On 3/5/26 10:55 AM, Geert Uytterhoeven wrote:
> Hi Konrad,
> 
> On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
>>> Unlike older GIC variants, the GICv3 DT bindings do not support
>>> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
>>> series drop all such masks where they are still present.
>>
>> I'm having trouble finding where that's used on pre-v3 even.. does
>> that actually get processed on the older iterations?
> 
> I had noticed the same, and had asked maz on IRC.
> His answer:
> 
>    "so far, we have never seen a GICv{1,2} system that didn't have all
> of its PPIs
>     connected to the same set of devices."

lol, that's fun!

Konrad
