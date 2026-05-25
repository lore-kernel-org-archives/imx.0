Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F28346E72
	for <imx@lists.linux.dev>; Mon, 25 May 2026 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712292; cv=none; b=OymPMJXSYDRj+NbEtlIzC3u8KQUxy6ONfLDp/Ly10eEVADrdPXxyhRsnHvsXSH+AspDefFI8/t0zb9tvTe65q39nj3wyBS0bW6hn3BKmRNtVbE1yC5N2AOqHdKfApPhtJcTTtM3iNVEfRlIRmh9dQSwnH0sjzuhBbUSreqk5a4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712292; c=relaxed/simple;
	bh=qpbNNT9LTg/BQrpX4c+/wUPqtP5MSqmpILKrnhojHyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b316QOCyQjQdSsv2UvXutUmT/UuGirssa4t0JoLecBfVJiTvZo6BOdI+avkwEUGUbsHJQH93P5BHijOcKiXXc63xdV6MF93IPXBVSnwpFIPFrCIqougO+mzwxIGw4XYfB6R71Jkd9cMScGc380bZB7qjfeY/9fBD3qsY5XnrP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRyO/m/c; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRyO/m/c"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso82043895e9.2
        for <imx@lists.linux.dev>; Mon, 25 May 2026 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779712290; x=1780317090; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=;
        b=eRyO/m/c+rwfPt+Sb3EgQziGud7D3E2jkoYdsrqZvjPbjxVxUWSahlBWGil2NmHZgV
         gDx/jcUtNzzd9XfV5U+WhvQFVyQRlUajj7GNat7BVNEr8gI21akJFxsJNa3ZrEK1OoD+
         jjZ9giRFubSfgOLhPcJTgLLT8AimocTNFi/BdpeRyLD5d4qlJ5XDh32TwLVKZnp0EFGx
         Q8GRH6q6E3fBbKtR1IebWIP6G+A6lFBt6iMYIcDmuQ1XoxqEtiWEyTLU1Nkrr3e4XXpe
         Ppj7JRZ96dxpByt8eLK3oQOy62zHfUIRJrfwysUVPK9ko/7quBupk1yVEDcHhziXm9ub
         4yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712290; x=1780317090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=;
        b=nQrU0bU9W7dymSdQFgDHOuUVxrlad0Xtk168NPESwHfdit5cVnpY4NzAkADkxQlF+k
         6oMyo3/Sf4zS0OuqBXfRWCcb4EnNbhbwfzfUfrcRL0CfnWpTvs/m1XHtv83lDqhfX0Wt
         zJXMMmgRae6PrHh9SlU25YL3VAR1zBevgmLo+/GtpLRuru/8N9MK/cgeS7mocilqk2X5
         jGZICT9TGJeZ6N4+hbnZo0aPRkSaOliXCeNuKdeasRVc5hjfT9dcfO8cDrg36KGyeKe1
         oqf7joWKj36RAuvG6i0YA8viE22GzLXldH9leFnyL1DemlbHPK49hIfSKFnk2Goqn3Op
         bTag==
X-Forwarded-Encrypted: i=1; AFNElJ9ACxE66iBcRkkc2ItYOcbq8keqq4euf34aUbJkERBBOFCgVFgWVUNBAzJ8r+UKg0087ps=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5wDt3ub0aROjZmHGZAl1vvW/A+S522jr1haBOqO3Kk29+ObuV
	pSqPWEADy0s8j79DvYC5mGdDcmA6+shcrZwXeFiBLdNo6CVlc3pu9kfj
X-Gm-Gg: Acq92OEtxxzYvor8PtX4/U1AshGdCADtZKZyRVAcjwqNgoxKzCq+eecURY7jddRslFV
	NOAzTyGW+l9z7LpV43pWmamsJPf9QOtjQPQyFfsSWAr36VhI2wMus7fYa3D/5y91bosEjB6Mtie
	cTAb7GyThOeLG9/Jmh1CTWcchsd2m2CcwtFs7bPdcLD9Gd8sT/azYwcL/3c8kiqe+9WmEjGUymA
	ogPExIIqTHyktBHR8bz+tH94N/U2gOHYkiIjFgPqTMvPspvGZl3ZabvP9+b/B5zWny6wswZmXWd
	g44ayHzjGsQXwEnz36AaDensycPzesCGio+V6TL0R+KZDITfPkVjc+5AVh+HMMsRPqRtxjPQBQ3
	Bmi0hNiFuuvsHRWJ3F5KdjIXMoPnqglJEU8sivVPquTk1Oa5/lCRF7cr0gDKbdGpAedATfEjCPg
	+Jk4jp6obTaJBwBUpM0GO35/AY5l3aGVcShMvPPjl1pgzyZs/+PL1myPjG
X-Received: by 2002:a05:600c:3d96:b0:490:5429:1513 with SMTP id 5b1f17b1804b1-49054291bbamr158545285e9.6.1779712289494;
        Mon, 25 May 2026 05:31:29 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e6d68sm85965215e9.22.2026.05.25.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:31:28 -0700 (PDT)
Message-ID: <9fb59c65-8cee-4502-bc10-1375f276e25c@gmail.com>
Date: Mon, 25 May 2026 05:31:24 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-3-laurentiumihalcea111@gmail.com>
 <ahOwO7LBXCYFIngw@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ahOwO7LBXCYFIngw@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/24/2026 7:13 PM, Peng Fan wrote:
> On Fri, May 22, 2026 at 04:18:46AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The imx remoteproc driver assumes that the names of the reserved memory
>> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
>> conflicts with the devicetree specification's recommendation, which states
>> that the names of the devicetree nodes should be generic.
>>
>> Therefore, instead of relying on the node names, use the names passed via
>> the "memory-region-names" property if present. Otherwise, keep the old
>> behavior.
>>
>> The definition of imx_rproc_rmem_to_resource() is added to a common place
>> as imx_dsp_rproc.c can also use it given that it suffers from the same
>> aforementioned problem.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> drivers/remoteproc/imx_rproc.c |  7 +++++--
>> drivers/remoteproc/imx_rproc.h | 19 +++++++++++++++++++
>> 2 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index 7f54322244ac..1ee1c658dcc1 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>> 		int err;
>> 		struct resource res;
>>
>> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
>> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>> 		if (err)
>> 			break;
>>
>> @@ -850,11 +850,14 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>> 	if (nph <= 0)
>> 		return 0;
>>
>> +	if (!of_property_present(np, "memory-region-names"))
>> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> 
> Please check 'memory-regions && !memory-region-names', some demos may not
> need to use memory regions.
> 
> Regards
> Peng
> 

What for? You'll not reach this check unless "memory-regions" is specified?
