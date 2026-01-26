Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92FB33F378
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 15:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440975; cv=none; b=qg2LCoHr2LIca9RwP07B+5SrbT+73Eu+vblIM+eYv4Va1pe4270dBRnH5RH/A0Tn1KAK0BvXTS1PzKLuVGQ5KImxS+mrEpMTz8QPcCuB1oiq0pdvb/fiVPFVRDyCUHuGYHESMN31rgiJ0MpKp+MCuvQEsmbMTnIhjAVGvmmBsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440975; c=relaxed/simple;
	bh=oehPzj1NcxPq0b6ZJi4vCnPjGp40ojSxR9AeiNKzfv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m16hHRFC4W5kZyWGJcHVMUW7zpwXw7cxEJyS/vEMeELZnVMyLLuUzwnd+0PpROC8JKb/lqtgmgrtVDMUOGBi+VbkPtFdvA/hIB1cxnMu5yJDxoFp1rlt13v0A9BhGb5VoLAc5yvrjObhzUq0GPVl7NIlxcv2GhDLcOu/sdMhecA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtOsgf5o; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtOsgf5o"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-435a517be33so2832264f8f.0
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 07:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769440972; x=1770045772; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oehPzj1NcxPq0b6ZJi4vCnPjGp40ojSxR9AeiNKzfv0=;
        b=KtOsgf5oAvsh9CQ/lMWMXHHjrHpgII6CPRLE1GipwlIe4EVPo12yVAJy5A8T/mEQlO
         QC5eD2QB6sRXaX+69aimznk1xhgAyTs1v0rduNFZ0mffQkFQBFjz9+IeSrtQydmTfjgZ
         6XhOdyZBIp2zvxTg3JjWyCJVB7XTp1uqkP2BzizcQ/zLNKP6KvC7z2SQ8EyJS5ZdsYWB
         TELC8R6TJD5n6m6tvJO1jxVMFDVaBU9bm8Czaxs/BFK7v5FA3N8qevzpN5ookYx9MGaC
         PXhloyOJVTwPZbrLIlkvcmgCrp1+QpIWPmW7kDc106RG6hgR6s1smmFN4mUuKKXx/N4y
         /S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769440972; x=1770045772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oehPzj1NcxPq0b6ZJi4vCnPjGp40ojSxR9AeiNKzfv0=;
        b=AbZ4oFnfo6WMATbk+57CNNOBkGomPTyxSDjxzA8XnDgD4RvKB46Rn4GPguU5/VNVgJ
         YFiS9dyhA1URL9V+BVNHCjlHJY2wEP2N26hOx4SnQWfLpLtyC4WlKrkbJoLZqo3iCHJA
         /n0KPCRergZTSdEqYPs4dk8DCjPRN1cT2XZ/UB2A5zpfwg86GfQMrHSfAOX9kujCoFuq
         EJIe9GqKmDq8gC5Hz+zfu+7NFg6rOWpqZs5U1RJA5P0DJVuU2GcOg1QAEWTQfjKamd2O
         Nybc+S9Mjx/NqtKZkqRi6eTiYdTPI6t/9y0MhjI52ts8WqWcVSQIZOCApYGDHZY9+DXJ
         WbKw==
X-Forwarded-Encrypted: i=1; AJvYcCXWJbRxY2ny7C2JcXiRDxxZf4gILVICpNvJjm9o+hCL/LNKCZ7dzwyJDH/afwRTKk5c3FY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmkelCkq5MXd1oNepLD60OL9GoeMQYMoiBZ/8qKGSuJd/4cW1u
	CnJo8e1sSdgFr6AV59ITWuKFc7T8lltXcFhBfdN/QuxurqhgKN1Ud9+s
X-Gm-Gg: AZuq6aIQlZY/Uw5oKGg8NG16q7FKq6k2Swu48PGhqHqemp1lHqBdgd3K0JhRRDkmH/X
	BH44vI/1V651FWBhK/MsZFJBbwm0b5o9n1o/PHLsxvsniZNWEtX2STPwp6a0K1Y6vx096LbBHal
	oVrmKNYLa3gutUd8Mc3t2x9t8X6OKbH9zGo3RAmw8b5Hh/e+HBvINbft4VMz8pTJDZxe5u5kWrf
	/jVi5SI9P/7bp3jNvyuU2atyQDgeA02m1CstTI4qeJaZF32MMDMwhCLlFRG0aexR7WyIFvsn5NM
	uI4zpImkQDntUh1gubUG7WB9wWdtOtpR5SJy6rCnob5UX81WMVEV3aFr8D43UQG1fGGiVFdi9iy
	M67Wo0ckg5gxppIuqqtK5iD1YjZkA5L6654D95wm3NNXDH+b9S5AK9tnuOq+Gox9HGvM1t3D2U1
	A7mP+3bhPw9opoUW5zgryiNcWT2PyLY0kOvCN2t0DqO3o=
X-Received: by 2002:a05:6000:2912:b0:430:f742:fbc7 with SMTP id ffacd0b85a97d-435ca0ecea4mr7122413f8f.14.1769440972075;
        Mon, 26 Jan 2026 07:22:52 -0800 (PST)
Received: from [10.25.211.45] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a6fsm31149882f8f.16.2026.01.26.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:22:51 -0800 (PST)
Message-ID: <b7c2a2b8-000e-4bf8-89cf-19e4e21e78a7@gmail.com>
Date: Mon, 26 Jan 2026 07:22:54 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: imx-aipstz: set default value for opacr registers
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 laurentiu.mihalcea@nxp.com, daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com
References: <20260126091156.951052-1-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260126091156.951052-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/26/2026 1:11 AM, Shengjiu Wang wrote:
> The sdma script app_2_mcu needs the permission to access the peripheral
> devices:
>
> 1) SDMA2 transactions are set to user-mode in this particular case.
> 2) This type of script doesn't use the peripheral interface (connected
> directly to SPBA), but it uses the peripheral DMA interface, then the
> SDMA2-issued transactions are subjected to AIPSTZ5's security-related
> checks.
>
> So need to clear the Supervisor Protect bit of SPBA2, otherwise the sdma
> script can't work. As the imx-aipstz is a common driver for all aips bus,
> so set default value (zero) for all opacr registers.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

