Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368958;
	b=u5I8GHPKKyoIg5FSPT+2nRv9u73vFZvx2qXXVc1J1Subaj4t3u/ash3wu619zLcN2mBt
	 oabm6lICCLuZ0zdFMwc0bOeSvx81JFrZDPo0O3F2kyxWXpw0cDcXqJl2xkDga/SG/gNbl
	 yocYVqh2d+INQNLJOoNlArD/br4eNDQAfN/pZPoMaPbvN8CZl2vnzgPECf5rnuE3TMCOM
	 LlsmFWNwD8GUAdzzT0QT0ttiyz83JUaZej8kmGVRdioNBLNY4MsW+IeHBLNMaO03WiNmw
	 L72TucweTg/4vp1kyz49fduNJioDRWWSNJrMbJQtOpWUZSiB1neI83ji/OGmLzY+XZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
	b=dYyLNvOMjXPV6JO5NyID2zzBAFDk521ZlH7Sw9Lx45uRU16z9wOfPkiLQ9dxb587RfOq
	 kMVoq8t9d62SbPdJsCbThUJwQjrPkePXTma3Z6XjjrZ/B8Cx2Or9Oq4cJTCAzsQOa//1q
	 hnscYhN1B5KBJ5OfjNA9S6Y88EKn9KJ0Mug2eg1+TUmrLI0oTGshGTf0QcVhrHAb7Aq8f
	 jU+/ihJfrVgmNZ9y156Y93r3uS7hB8238nOHYWy2JlIM5An31ByBZdra59vlcsF+J5GSS
	 ROaPDJ+Azs2HXwBiMQOAFs3NT94cxVSs39TRjv9R5/xeLC0gAN43ILG4tf7+mDk1Dng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqjFGRzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5pkDY5J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACA1606A31E
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CACA1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EqjFGRzf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D5pkDY5J
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn6kI3479702
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=; b=EqjFGRzf/gwkWbvG
	dqk/FZNrc1/HzxTW59nTpZrbFLdJeiJBsjVGWy9qKqEwiue54I75NBcWFtPBESfB
	1k+rixQz1SHx1zeBKvTdw5NX9owTe2RCUnpbM1NaUFnaO6/ZmD1pxDJJq4Fsr1sO
	TWmQjwSZ9DIrSZueS9Pdnmc0HypoPmfMlkB4hNDSgbAWHvpTL6qsjjRIQErJ050k
	VYS/qFtDXPSBXDJ1shKgsacT7ssLaH8bQs61yqUiayHLmANTOg1KLKdxXnCTcYcT
	nRXtg/VrvWMM6Zqok4PGXJts2pKVFsV7MRXzJUM8tg+zkCsOWDu8w3VCeU7J1Qhe
	jBqEfQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkbe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:02:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac6157868so1683523e0c.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368956; x=1793973756; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
        b=D5pkDY5JMZ1tPe+3hNmCqKkYD2Z+4DcLVic5mvs7z2iOt4MCxHHhhUlYaQdUOn3d/t
         /a2RJu0sixcMIVQj3BNZORcx6JLF7qAZc3mOE2Gxpu9SNqvXwNdwvFNiME98C7bJDZxw
         2HA8BqEaZarEJmWYPjEe7/325XsMTEFLYli6ABOBXB3bj5uWcjVtqKEUUGbEnt0u1VRT
         409V51ATDNxNVgzwBC71pizayXb6rRBM7HPBLlkMmoEU0eG5GMAMXskZn6MgMMPuMbQs
         qOFrPL12QvnvxIPOtpRmMDPzQTgUCjhWJ/4IYEMX+k+chRETVndDbz5E+d7/ew1aADjx
         zlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368956; x=1793973756;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNdI+7KWoCrid+Fm1nxPILWoTNaEpSSdkMdBlIEtalQ=;
        b=ELRg6oacYh2PNTOqLpv869l/JQ2D/TpWiOF36l7NoIu5H9mwf9msuAljrwns4S/6DM
         JKePzqdg3S+NhA0SG6EVInN6gKnQu4ERTQ+ddxCGafcQcXysY3Cta7nkxHf7EWrvgDEX
         Ep2mePtV1T22RNVH09VeJsohLl5VNgRbq5NlfDGFu1ZOI4LTDfnFYgv/T0HchL5ySCUH
         ueatX35xFSBYZrHeUo7JG+j7cWBcMWqMkR1BNsgPhlfCpH8to5zZ3ohBEpsbuOUa4pCX
         dR6dvdP9rHeJDdEnFF6mowQQ9z17+nU2O60WrL1llTxinE9cQplZe56V7gJIdGnvrBA+
         jrqw==
X-Forwarded-Encrypted: i=1; AKwUvBwpQImTwdqauACMk1vXg+tepVFuAh/oLUPa+eRqMWmaBF+8JgT6qj7bdeDGEGm/ll1E34E=@lists.linux.dev
X-Gm-Message-State: AFq9FYI7xU7Ii6P2EYOv2B5Gf7NLiOpMi6Jmwey9W15jSSFJtZt8Sdo/
	P25EgRcBKB+jddpfQXYFpw+E9SLGowoy/ko36wJ0GEVA1sFv187iWcl0zbBw/QiAGkiRajYDaZJ
	g+qoAXAFdR0sbBkqLkf+K2VO9mN4tfMUUAreDcEky56lJuV54f2cwjKA=
X-Gm-Gg: AYBFou3BqPv/RSOvTJNv7QXXm7Z537aRNRomYSJfJKEJL+YMMMQVtMGLso+Ox1FkNB5
	aCYS6W+kjcc6lE5jMEawxxYWq74d9/4cgT98I57hiK6dvVNUlx5219FMSB5vjiW6dRzR9eVPwTD
	JGVnTNCXA5t8RzDB2T7n5BkVgcgp3w20jmtB0wz72t81WGJxh+Yn1psRPhtIhAbDgXvlBhwGOMp
	GzmRtlMTVU1b8wUqQxOcK8g3vJHvoHWBz3RnzqYRIUw6tbUh+ZnBN+kOq7SGLoHIKNOsXsvrF/4
	W17UbvaCBds0WnSVssAOfKEgMX2Mzw/xq8s7IYkyoJckWRVD/1Rs1LbW6XGg2Y5hfUxYNID/aeM
	Va27XBH58gzi1SRbW6GF139lQSlCK/D8T0SwD2hjaVRliAnIv0ZCP1nkQZyxFUJcdKG3PsMxpXp
	k=
X-Received: by 2002:a05:6122:3115:b0:5ea:ca0a:374d with SMTP id 71dfb90a1353d-5ec587af5eamr1870753e0c.17.1793368945654;
        Fri, 30 Oct 2026 07:02:25 -0700 (PDT)
X-Received: by 2002:a05:6122:3115:b0:5ea:ca0a:374d with SMTP id 71dfb90a1353d-5ec587af5eamr1869535e0c.17.1793368934913;
        Fri, 30 Oct 2026 07:02:14 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e719eec22sm3808245f8f.0.2026.10.30.07.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:02:12 -0700 (PDT)
Message-ID: <256cbe11-86ae-49e7-b7d6-0b0eb23a79e5@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:02:10 +0100
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
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner
 <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030094515-afbbbd16-d834-4ef6-8910-e936476ea018@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xy-lbGRRc6ew8LK16jksp8pm7TSNOrqC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXzYcg9/TTvgba
 mcO2CiR7g/Y7ak4xVHEfeJiOzh3KMxBqg5Ws82wSFWz9HMutzrC0XEzqJ4XNFHwQzblAlO7e1HG
 IjLJG1Za240h95sGUQo0DtGA5forkCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXwo10fpWVckXr
 azZ4iNaBOkfNzivlAL6q9cU3c3qm+WY2YpFu439+wGocHarFi+cYhKQSSqoEHCJYfx1t2/RtHjb
 FH8ASZVR+DxbNcPQ0CjT5DgFbwg0undlmAyqQODkzVEnDaGdcOi/8BHjao3JaJIdsu6411Hx83V
 USjT7sNmQp+HZ+eNaN36Gp7WgVA6RLigI7POfbmCn+Fprup1po304V3zSc89COJpk/3i3OIhYuh
 R9vC81jDtMRyfNNLwv1ofjrLJ0BiOkJpGF4erdVCu2LtECY1qQj4u+VrEzRk8Psg2fkMdG76zYi
 E+eMAJ0E1Apaz4u9+RseBTXrrITe73lOu4tdWa9JXLSSJEwbyu0KzAPUsgDH5avlvfI7jsOhvOM
 pxuvCS/Bi6HQbckupaS5iR8ONF902T2g/YmYD4kLTzNuFrsCZR6hY19BP6/IobLldROl1fe+2hW
 mImF+jcQsWQkUEZanwg==
X-Proofpoint-ORIG-GUID: xy-lbGRRc6ew8LK16jksp8pm7TSNOrqC
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4a37c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c-0_0CVZb4FivoHw4gkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On 30/10/2026 09:47, Thomas Weißschuh wrote:
> On Fri, Oct 30, 2026 at 08:11:38AM +0100, Krzysztof Kozlowski wrote:
>> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
>> can be constified whenever driver does not modify it in the probe.
> 
> Looks like a candidate for scripts/const_structs.checkpatch.

I think no, too many false positives. 1/3 of drivers modify the mfd_cell.

Best regards,
Krzysztof
