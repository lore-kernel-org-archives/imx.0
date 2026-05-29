Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F76282F0A
	for <imx@lists.linux.dev>; Fri, 29 May 2026 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059882; cv=none; b=BaUoMMo0LJCJdvoY6EPZCndRcWz2HkFs/yL7QwfudJvoE62aU56R3ct295QXnOkHQyO9MjFE68Q08zUrq+1n0vnH6nR+pKVQ4iaDhoTP+dOIzwmCDxsQgLzwGvpLBbA9rv82e6sN6+7N0F40B0ejN5z7JpHR2xiW5wKEzMdWmZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059882; c=relaxed/simple;
	bh=H1B+xAqwXLNNuThmDhrS/L/FvBoP1ll4glIpB83aMlo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JMHQWrvUjk1VzDmsWEoT62pkJzGHd6ytqQH+jQudhcFXBmPb30oH2rwnZ52XwC1QLpn+TNLQA+lyLSuNdLHRCJYr0b5RodJ084ItEUjCTeeVwX5WnjzDyutmhKEwOWC04+2DNquNrk2lkXsLPlo4gufHh8xi+aEzCRW+KSBsQRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enTgqrIl; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enTgqrIl"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso963775a91.1
        for <imx@lists.linux.dev>; Fri, 29 May 2026 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780059881; x=1780664681; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSA8t19jfeD/ffTmYuzFt48kJrYE+ahUE1aM38C/r4M=;
        b=enTgqrIlAnFLM/Gh/QNrz12epTXybW9u+elfnMolTfOwTSi+Y7CqLoxRWMi3aCfNyH
         KSu6xq2XScmKkgPDW/DonEC1sWooUmNV69YF1LILSuwL4DAIPPTY9RXl42UzaGEqN97h
         0LmiVjdamvBYijqQjZHmgD93TVwBZkcGlGU5V7MUI6qtqRnWYkSdpKgt0GlQUihrPwyF
         meIpWFsBOjRVeQazr1pUXVgDF+a3f6dfj4SWOHwya0P8zPfPwvaZriqMmPVCsWFhKQ0o
         +qaIqFca9y+ZP1iGiW1hQPQmyA7/75SRS0QaUoi4kL54k3RwbbJMqFEAxPJBiiAmKsqq
         MLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059881; x=1780664681;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSA8t19jfeD/ffTmYuzFt48kJrYE+ahUE1aM38C/r4M=;
        b=J6ODlEjGBdJo6Igjrf/L1alR2SZaoaKwTCdGftqwcaRjlwOcrItt/NSHH3f1UhsOH2
         GfgFDh9p54na5Ji7dxUtg0j9iSMvnqvcQEG1vUQsvt1+ESjnLrYBVs1h2qHiHeCXT/6F
         4nTer4FslmSCK9zUFQMwWNhCD5gr7oG7Czrwk97tTDcVToF2xXU/QtcghJjdIgIPBLH3
         NX5MMZakKEBoRQI1DHd062qTRR9uHd+JevKnRVYLb46Q9P5eJ+TTL9YkREv4FwtoRIiR
         TiXddBDX1z2rVkSB2eRqVeWcxtoH/3V0e3Afsjy+n0MUn43a8d4b4hf9zQPtX2IqkZgo
         2Ozw==
X-Forwarded-Encrypted: i=1; AFNElJ8XtjdiQNlQhTZCob+3n8hKah6te/iANL+ZPaEl9TmPpIkovKZTxiYp2FQl4sVpMd4M5eQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvBHKc6CoiFt2yfjnmDVASw1pztDlbxvXYHhgyD2UVbHr/FwJq
	/nEQyadFI4bfUQ+svbcBuwFNYZ9xvRhwsMJHLWbo+BpABupFoK/oMItWh0Pr4XRj
X-Gm-Gg: Acq92OEDxpqXet4Sgkd+deyPlhFgqZ2L5+neponAx+d3+PxmB4hCwfnhW3DTgwNKres
	hokr+dp+KM0IaiG/Bh/VxGln0pSf3prdbcucXxXOr5ncQe4NXeFbb8+glmFzXvXddchNj5pTVXV
	mpNLj9Jll1lySpAwtiFbU9TbMikBxfvdKnvptyeN++uuwv0QNoNGkzm+gVVwTdtOGRVvqi0sjM7
	bsStq8WyujbIRrWAzF4pIS/LQdxKanvucKqZVoi+kq7JlqVDBNpygyYENKgWn5cO3foGzFCFw6k
	Y7wsof2dwlp0rBWW2efoNE2qmJxEa5/Q7rRvMBa79xMiajbHXEv51YAtlKb3R6kXwXoRkQwrstY
	MbIinZU4YEoiJVEq7zU/JfJs8KMMDAKuXbuy4Kf/KM7c6l/Q6dbz17VInOipKVg+xeUQvnU0ive
	TUTottiGaZBkfiI4VZmLpJWZxC1lj5EPvHrPcwoe2JTNj88KZgE+YNoR4pLRdE30Q08WNMIN2M3
	qRo
X-Received: by 2002:a17:90b:2c8d:b0:36b:afa0:c675 with SMTP id 98e67ed59e1d1-36bbcfdbf27mr3443848a91.26.1780059880841;
        Fri, 29 May 2026 06:04:40 -0700 (PDT)
Received: from ?IPV6:240e:39b:ee1:f550:8519:8be4:eab7:7536? ([240e:39b:ee1:f550:8519:8be4:eab7:7536])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0c341dasm2283157a91.15.2026.05.29.06.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 06:04:40 -0700 (PDT)
Message-ID: <1329d626-01ac-4de6-a4ae-51432d7bdc93@gmail.com>
Date: Fri, 29 May 2026 21:04:36 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sashiko-bot@kernel.org
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, liem16213@gmail.com,
 sashiko-reviews@lists.linux.dev
References: <20260527172255.443CE1F000E9@smtp.kernel.org>
Subject: Re: [PATCH] i2c: imx: Switch to new reg_target/unreg_target callbacks
Content-Language: en-US
From: Liem <liem16213@gmail.com>
In-Reply-To: <20260527172255.443CE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Subject: Re: [PATCH] i2c: imx: Switch to new reg_target/unreg_target 
callbacks

Hi Sashiko AI and all,

Thank you for the thorough review and for catching these issues.

Both the dangling pointer on pm_runtime_resume_and_get() failure in
i2c_imx_reg_target() and the missing lock/timer cancellation in
i2c_imx_unreg_target() are pre-existing problems that were already
present before this patch. My commit only renames the deprecated
function pointers and their implementations, without modifying any
of the underlying logic.

I agree these are real issues that should be fixed. I'll prepare a
separate follow-up patch to address them, keeping this first patch
focused solely on the terminology migration.

Thanks again,
Liem

