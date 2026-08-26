Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD22738836A
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732687; cv=none; b=a46bRYE6emoR64xZoaegCc3w9WDphfRBmkWvyNPBtfHSdEjVTfAG/ycMmiOdwNjM12cF9TwlU9w+vTDEeFv8YNwllOXiNgRBPYTNzq/DWBkqGr7/+cQBfwVMYx3O9k4FO2uNvtwRJrnUC4zbAW28icbZjhhf/fvo7wUClHoCaRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732687; c=relaxed/simple;
	bh=Y8zx2w1AIDgfPowWVDAXwKwQkjMhicPcg6v2Sd+OOqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rR2oetfl8/cIeIUm9tVOC7cuRuiH1GYSWQhUxtxEeVLnCYNAJ9SRMX6lZaq7T0pIMScNVHyoD1zKj3fj57hOCy+WdQixQC+y3zK+xXkaaU4wGYc4Lr3/UjSSjk7JHhdX+0+7qLXNKoN6Or6JbSl6D53cNZX9lSSRqdK1aUBMvso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crbRM4QK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crbRM4QK"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15cd3fd760so73863566b.2
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732683; x=1788337483; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ir5Os0CQnbQuxUCzuubgRfeVAkcH8JmP+kvrHlYfrQQ=;
        b=crbRM4QKLiXTsKwXazht64lxSfU4Ma8hCQKnC7z6+y0gQdbNFPDx3Q2Pq0WLp4I7ub
         3WbRGrPm66Oqme/PRKOt7aOUfNeBVdjiDSs1Wu+uhVOs9BkEDIJN+5D7Dd9/JEi88t7t
         25COQep2blnl/fATwRcYfVEiVDQv+llDWYAO12I0MtD85JU+x+qMxfyAXetq7XZiUIDf
         qGztlSUyDRLRN6hQJYBteCZoqw/UjAO8rVNyMMPEXcgLqKHAk2Uw8+DMius3bZCdevpM
         0O3oiKqV+kyTNhVei6NSwQLwJEoXYqyRSyaRNw4i0UpHPexk1g8eWvxOyQFtYJDwxhaJ
         Z1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732683; x=1788337483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir5Os0CQnbQuxUCzuubgRfeVAkcH8JmP+kvrHlYfrQQ=;
        b=rkBSOdmc45IXf9K9QHKuejcat4KifRn/KmLlOEJ4a2aHBXyedKbojIZqf02fgrDXbJ
         I0Uz+iacECRI7b/M8f7LXChCm1Oqz2fgKygQuI40xe/HY4XMxvOzCZhrOCSWE+K4XXTp
         XC4jAmQtP5HURYTmSWXDEBYTl2BEjaLlZHLeWYex5qCCZpycKGuVZRDMAyBJI/AATU22
         tpk+yO31SxwMAzwrq4BuEZIcTQH4/r/yTPqHhXKaZarwkDpDcjFdUdTVDBSnDLQ9r4Dl
         3IKLlQZoG+gXJOTPlVbmOU0ZS5Mf0Lew9VzDdvFjeEFaOlUuIK01zT47+gEI1AdYznq1
         PZGg==
X-Forwarded-Encrypted: i=1; AHgh+RriY8sOahgqxDqAizrJRXFbgSF2EOZkD9t6JtHIyex+0gVWP4TUDteo079qWprDuA5cAds=@lists.linux.dev
X-Gm-Message-State: AFuF++nIXg1/lak6KWqecSh+JhJF+b8rnzQBKl13Dto2rv/70EtXUQtn
	9KdEYcXkb6IUIpGptKlpTR5vcOFc+YnAQguiIALg8pc/V0tEN29VHCR/
X-Gm-Gg: AR+sD11P3Kj8075JABBzqkrzaGqknfuCYHoRih/bqTQobH169CguYM9pM+Ir/cEzDZk
	P7gJVqi7ZRoZEUavhQpraOhSPBu6olnGOsYOCO5HDOJsXJvv4DbYpt6zc3HW8X4cRi2Id1ncB4+
	Ue86gQS2jxrfJ3STdxE747AlnIQTplnI7S5RcQtrwSfMnEwZppxdgsJg++atCR2Z2soTlNCGIpN
	3iYlRGNtFcw2EVD7K7oN7WZ0M3jZu0/QTunpJuBbEnwUbti3kSpp4edCpsbiO01ARY+A7mjgdEM
	WVNg7EVg1Dw/tieKwstw9s4Wcw4Zr7apzCroo7Hw4YCpJE7DYXgP+gGr7o+mPu7eJFtp6qW5EiX
	M8n6Qd94i8t+X8BY84Gt4Hhp6FcnNVeI52IB6or44HrZYMsD24IKbsllH3ADyh3nhx7KnVfVJWa
	wEEQkWz9aKA74Kw8j9RBM0Rrwr0U9wmUaU/JtFi/xpMU2C2oYditcU6/FJ1LImFrUMDt4/O/6Dz
	gyy6L+20+0k0TiRq8UnQw==
X-Received: by 2002:a17:907:3cd6:b0:c1f:922d:34c3 with SMTP id a640c23a62f3a-c250c308f96mr539179466b.14.1787732683231;
        Wed, 26 Aug 2026 01:24:43 -0700 (PDT)
Received: from [10.25.211.251] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d6acasm419960366b.9.2026.08.26.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:24:42 -0700 (PDT)
Message-ID: <1c5e12af-927b-40c3-b682-8f432a0d9907@gmail.com>
Date: Wed, 26 Aug 2026 01:24:39 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, elena.popa@nxp.com,
 cosmin.stoica@nxp.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
 <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
 <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/25/2026 2:52 PM, Fabio Estevam wrote:
> Hi Laurentiu,
> 
> On Tue, Aug 25, 2026 at 9:11 AM Laurentiu Mihalcea
> <laurentiumihalcea111@gmail.com> wrote:
>>
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>> following hardware feats (list is not exhaustive):
>>
>> * based on i.MX95 19x19 SoC
>> * 64GB eMMC
>> * up to 16GB of LPDDR5 memory
>> * 1 x USB 2.0 TypeC
>> * 1 x USB 3.0 TypeC
>> * 1 x RJ45 port with RTL8211 PHY
>>
>> The support targets revision B of the board.
> 
> Please add the bootph- properties as well.
> 
> Elena plans to support this board in U-Boot where they are needed.
> 
> For reference, here is a commit that adds the bootph- properties to
> the frdm board:
> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/commit/?h=imx/dt64-intend&id=50c0d934698f7602d579ba21262fcca3643c5464


thanks for the idea and the reference Fabio! let me try this locally and will update in V2 if all's good.

