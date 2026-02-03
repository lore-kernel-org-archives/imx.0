Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BDD347BC5
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 12:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770123482; cv=none; b=fYFDz4eQq9UOadKcadFLT02Ue9yQOT9bi64Ky/h9OXoXGo5kLr3v0H++uSgMoxlKnRBQzCt4hIFZ0QB28fdOn/OWTSVOVoFScQq5Z9FEjc5bPKoWwJg+Ei2bMPSc8CF1VylU9aQuesxmBWM4PGheQKCYZK2LhUTh1lFOsZ7H1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770123482; c=relaxed/simple;
	bh=+mKFET+e8i5QW2DEffDUHTC3weGam495Lmz1WJ6t4MA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IeNWwbMi3aPEO7i2DCmSIgKUEFPsur/Fc067+JOM8XweYAFjKJ4DV3HywTzfXOy2HKgpL+5s4L1UCQHK+5s/RkT6OsL7tP3xOq2Stz1Xsp8DAWaPpMDZMVDrzyhlCHAAnC/f4yZgS/6oWYPwt7fJx/JdRRmGQS4d3vCGMSXX3tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDP5U6KU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3gm1o0z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDP5U6KU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3gm1o0z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613A8gQa933184
	for <imx@lists.linux.dev>; Tue, 3 Feb 2026 12:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqeK5vhKka3TksDZMycGOzJu1d0Xo7PaA5U9WEk5Iaw=; b=NDP5U6KU1pxo8VkU
	qfS/Zmd7R5f1KFqLk5ELIRifMxJ9JNYiBzbNAUOPg3MJYaH+qWcYvcyGk7uY+gnk
	yGuK1AscQwJPmTmOrlhBzW3JLTPf0bvuyyJ+MLBW1vFx3LF64hlufasS7IMhDatl
	kXr26pxBQuO2gyahXnB9z8f7RbsToGMQYzOn6GVkI2NfGZ3afBu8EipQU2eMQiCc
	PGFcewrzyQwNO1xwAaWNlsXXrcwL0SKcdv5Odl83tmvd0vAftIkltzNgV4HzUWqc
	hx9sPXxOs2HWv62X188q9jA+J+tYKmH9NXi3IgN1OU4wU+HnqYyBhQ81QDpkIkDy
	F7+CHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu1nbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 03 Feb 2026 12:58:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352e195f662so4794965a91.2
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 04:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770123480; x=1770728280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqeK5vhKka3TksDZMycGOzJu1d0Xo7PaA5U9WEk5Iaw=;
        b=U3gm1o0zsFQ2zD4zIueXNy2z2Z6v6vo+dpwb3eKhAfzHlQS9nYlwZXBO+wDpjEclAf
         0ePgwhUIjUxZHJNKdySKqFNPQEcE2WbGAbVzpU/91XvHZ2eTbNXinOvStSA+Cj9ZiLpj
         SBFDVyhx0ZLgKETVAKyYHMy9PkIfA6gEBCzjV7n6/JGK2lIjtp86TFwOnPlfSVUGBhGc
         qn7MXaPTa+RYDGtrgS/nPr7Sp7l1tKlLToItMDAA8NV4eDI0pv0CLZf0Kco0cFU6tA1y
         29wHDPvLQRwyzgGsA+vE7QUAxbfxSq58Z5fIs0kkBHts+hhwnH+wzKh/FxWJk+Lfci7W
         y9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770123480; x=1770728280;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pqeK5vhKka3TksDZMycGOzJu1d0Xo7PaA5U9WEk5Iaw=;
        b=Gn82vE1+OUAAyBcZuDfdycV6FkgukGGKloxr2OChJCPdE7+EX6nAUonXT4mzsn8ZIe
         T7rFIq0wTkXMznovzRuOdSrWAf28seDFzbQDx1qXcPzrvtXA3zEdslyBRJDiAj+XtTcO
         paY0UyE1cgxHOGVC1rB9c3RZHIUVg9Zn/iqr6PTdxFKxO5bDym/N3p91h9VGfJ+9NwTF
         YrQsSLZQRNNTchwHlA97yTyluzFffiT63yeQM6Ag6ybMr7yZx1m9h4MKp03pbte7+qc8
         NzX60mww/P5+4lLyF5EKk/1O/Isqqb2DyRSyNfVgImz1U7aYITbr5bqIw6RBRIX3SwQa
         C7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVKapxNLmFMkGx0hSLKV9EMSM16QM049VoG6kJUYb/E0TknMhXOUbMhd/E4I8VDJ02Ziag=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZpvu9sX7rfcI5ywYwRGSwTGLELH4N51nxr5ucYUhZ3GsqoWF5
	6ZProoHUgfYUSo13mMCzDTMfqp0LnEkxRZojvFJsD3Cy5fHFpOEfeL363qY1j8OsOWSORClv9ub
	kaDk+towOMPQK8+UuC5Mks31N3Ndgqikyy8nBPbFq8ydrrwmv+rJwTuc=
X-Gm-Gg: AZuq6aIoEc0jTjb4uw97ovRNZ/XPCbdfDJ+htEyqbij20yW/Hn5OT+FDmvDwMmpA3wh
	Rk7bSo78WAuhGmtxirahLw3swwygSM5FbJUBULXmgA4oNVVYrAqu8ETEkzfLQpo1baULyIi1sER
	yHAV2j9XTGOXjAEZ47wb6htBjT2ua1qES3wd5dY64Vl6bq6vvmekwdHfXwiwJI2wxd3AdthhuJf
	plvWo4xzTApKpFApgWAYFjXgsrLn9lPvx+Kw81KuQZhxF1ep0ep1u0PcFXKgNrnkPHjD/Uz+Gl7
	qv13vaqcusFCtrMlKCCjP7tkshdLhTKvz8DRKlclzGFMJ2VvO77EKmcW8ztdb+mhrqIn6mla+LV
	82pl88Mte
X-Received: by 2002:a17:90b:3fcc:b0:340:a5b2:c305 with SMTP id 98e67ed59e1d1-3543b2f30d1mr12888755a91.2.1770123480146;
        Tue, 03 Feb 2026 04:58:00 -0800 (PST)
X-Received: by 2002:a17:90b:3fcc:b0:340:a5b2:c305 with SMTP id 98e67ed59e1d1-3543b2f30d1mr12888727a91.2.1770123479509;
        Tue, 03 Feb 2026 04:57:59 -0800 (PST)
Received: from [192.168.1.102] ([120.60.74.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547778cb83sm2486926a91.13.2026.02.03.04.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:57:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>
In-Reply-To: <20260202151050.1446165-1-vincent.guittot@linaro.org>
References: <20260202151050.1446165-1-vincent.guittot@linaro.org>
Subject: Re: [PATCH v2] PCI: s32g: Fix ports parsing
Message-Id: <177012347566.13350.2655028936116528318.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 18:27:55 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMyBTYWx0ZWRfX1aF03Du3dlKe
 K7+xwiUhTEZfHE+7Cq8g60adt5j7L3jPHvxSYKzWRCKglBGZAEbH/siDeYOQ0SDmDloT8aBzac+
 VD37HlKyIEvnI8wqShicAW1CptFwVQjeU6GucRxlS/7thg/MR2gIx8WnDmvIGmmAMR16H0jSVQq
 hLIi9imwktPYgPYNln8Do3EhFfSyXYRacyMaVa8i+qekJ5bXsvsYU03O2H8vmDEe0Anaz7hquCc
 Z2GuUbOJwdi0093qlMfpyjbX7JY571mCkb79Sy2uUdrqb1dYgCE2ngmL0XYq/5v5YdS2HRVPTrX
 +R20G6HfNosnIFNBNJUrY5vf0cVuMMEjrf4pXjbLDCgwNZMa6nGkHH3ztql6F5Mq4057nITaTXc
 4bXN+dwqDpOfhZwzJWi6UMdjEJNq/RdNkI63OXvDvuYdx6STu+nDcSKZjFJ1IJqc7VeCpu7YzeB
 sbaV8WQUmQwGea3cDBg==
X-Proofpoint-ORIG-GUID: D-LOPWId56JT7PIy-S5zmaRFr-39qMBf
X-Proofpoint-GUID: D-LOPWId56JT7PIy-S5zmaRFr-39qMBf
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=6981f0d8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=A3/yxVAzUcVmDczBgoabkA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EvYTMdlcmL0OrTEahKgA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030103


On Mon, 02 Feb 2026 16:10:50 +0100, Vincent Guittot wrote:
> No error return is missing after the loop resulting in removing the
> ports from the list.
> 
> 

Applied, thanks!

[1/1] PCI: s32g: Fix ports parsing
      commit: b79e0875fe8144fcb09e4fc1cf386cb3b2262480

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

