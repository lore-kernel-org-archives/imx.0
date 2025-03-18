Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A5A3CF58
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742280982; cv=none; b=W4HtPs6j0IUkhi5LdXduznWKBHiD9OBMnosPq5eJmY052aiLQoxPviwFeXqFwon8nyxxt/EMYGbGoOzYu4tXf8yBWPHTXGAWzZ2D1mAawEdv1oRrNhAa1cdZ+U3xXwsPfq27CnjjozdLbjqzsapF/4mKiPF3skJhILX4fM4BL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742280982; c=relaxed/simple;
	bh=2uO8v8ygGh+vmFJg/PzkAuTzo+G7jTPm/LwNHL88dBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kwdc2sHu1KFh4gOHuGL/7EjfuJp62bbkOaMx5PfOXcd1bmN/upwQYCWeZnugTyI77OIgOPOMXaSxSw5yZQ2wOmYZy6DX2TjwszMB4VFGqwfFIzeTQul2sNQIGd4Lru288HffHGmxCOliANur9sI6EyFR+hrbAPDZSLuOmtRu19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQ5L6JXa; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ5L6JXa"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so818280866b.0
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 23:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742280979; x=1742885779; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwcG0nkjUDlN5Bh/rhj3k2ZPiTcT+O714WWyKryB05o=;
        b=HQ5L6JXaxchy7jPbFJ3If/oMOqyOfAwvO1OuQOkGhSAQf9rtUMsQtm0Y2nYt5rBOFA
         08EzGtTXyekZatYjsb/3RlQco/PFWkxjP9g1pbddgGyx22xjrvCb4iWUZUtwtkvjD2i1
         aUcJhiYRWwIm9O2P6jvqppieJMQPH+Owy4i5F4DeB7f9Fp2yGzNB0oHQbJn52NLjn9CE
         No4NokBglG5fBthJtsLl63C7uLyD9FrojqWG3zrERzbwikyMVruXJSQkrWCCe2uzx7IU
         ZZoZXBMXXHO8YTKyrPdxI75AsBd6ynQ3kmocnjNu3xqf3ZscvMpisJgR17Tflo5pV9/h
         aUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742280979; x=1742885779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwcG0nkjUDlN5Bh/rhj3k2ZPiTcT+O714WWyKryB05o=;
        b=cjY3s5WLna2HZ1fRdpJMwUHGydWqgupls42N/mZpywaTaZoywZHZ5xjkeJfgy3yRrV
         IhDNadd7vZy5Ei8cK11FPUus4b7RV5VfydPdKcelXenAbmCuxYhOJQbApCX7dE+l/Dal
         1AzGIwCPfJgADs8N3ilXV5T+ojatUfzKk+NF2X+5U2O5x3aByQCfvB/HlwYxow2pxVBY
         GztEGHGO2oQafaE+gAV0ixZdsXzW/y0zybmdJ+GUFlc4uM2/7uucaonx1AOP34Vex1My
         EtqctK2BR2SDvEVz2MUMF9qElkqWFBBw/dbKImS2yA96vJ0XzHvqAjWSn5gV4py52Bvq
         BJKw==
X-Forwarded-Encrypted: i=1; AJvYcCUzMFtiLbvpcdr9fK+5fzssEXjc6Mgsb4gyBFt+HhsVKndZMzcDMkG7CJw7EWc9j+18CDk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxaNmt8xgMHtZB02L5N94ZS3CPmDPplXDvYkj701+9X2FOtGml
	02Nql/+E/N5gHxeKvU2pLRqRD2CoVBIxFGVggB7RSw8z/99v27wG
X-Gm-Gg: ASbGncsmcDMoreaYbA8B54HsQOc+/K/n5OxedRw8WP0OtRIF2l5cXGCjE5b2xtuWySN
	IuNJ/kaljLxD3RIww2QGiy1u9oNQ5Mph2JqFi3NhhiHS5hgXSC5Ept/ppbRo6i7I1sxwxJn3RC3
	Z/jyJahhxMZYN0jdPVt6P75kEF0ftlpQd/nY4eHZBWPOPgQrOjOSKDGD7+4eiQfIETauhnQ+IbM
	0SUqMPJkO8FGwuzDCmYRFkKzcqPOGO6kdyk43TqLdsz9sV91ymdKfZfeXtAGXQ2PQeZCR4Xcx2Q
	MtY5kt4Lq0pDhs0p28DSCvZ1ye0eystscp2NaACXGPYfkLyjKYqyKRTLdhybJbFA+OtowdL7Vyb
	GemNxyMH+rJ/RHKc2yGxC/CEidxV1PrQwK0x8eFqDn6KGaQ==
X-Google-Smtp-Source: AGHT+IEFPFabopy2MYvkvMtlIv02ESYxo7QfPaSYD2btK+WSLZa3CANNpz53pkWjwY2mwptKmEPudQ==
X-Received: by 2002:a17:907:96a1:b0:ac1:effd:f2ea with SMTP id a640c23a62f3a-ac3302d1dc1mr1648297366b.24.1742280978900;
        Mon, 17 Mar 2025 23:56:18 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-251-108-181.retail.telecomitalia.it. [95.251.108.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac38f091c7bsm106906766b.38.2025.03.17.23.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:56:17 -0700 (PDT)
Date: Tue, 18 Mar 2025 07:56:15 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
Message-ID: <Z9kZD0vEsrrIftk5@alb3rt0-ThinkPad-P15-Gen-1>
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
 <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
 <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>
 <Z9hxKlrrqW4QyzdJ@alb3rt0-ThinkPad-P15-Gen-1>
 <88c66c98-7ea3-4172-9c99-405fe449cc5b@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c66c98-7ea3-4172-9c99-405fe449cc5b@linaro.org>

On Mon, Mar 17, 2025 at 08:14:30PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2025 19:59, Alberto Merciai wrote:
> >>>
> >>> By default they are enabled as external modules, then until we don't
> >>
> >> So everything is as expected...
> >>
> >>> reach userland they are not loaded thus eth and all the mechanism behind
> >>> that are out.
> >>>
> >>> I'm not using initramfs just tftp and NFS as follows:
> >>
> >> All arm64 platforms are supposed to use initramfs on defconfig with
> >> necessary modules.
> > Thanks a lot, I was not aware of that.
> > Do you have any reference?
> Reference for what? initramfs?
> 
> I am using meta-qcom initramfs:
> https://github.com/krzk/yocto-qcom
> with copy_modules argument:
> 
> https://github.com/krzk/tools/blob/7c0d1cacad06aa0cae8c2983ae26889471a9aaa6/linux/build.sh#L543
> 
> And here is how I append stuff, but simple `cat` one cpio archive to
> another cpio archive would work as well, just be sure some paths are not
> symlinks (/bin /usr/bin) because then `cat` has issues:
> 
> https://github.com/krzk/tools/blob/7c0d1cacad06aa0cae8c2983ae26889471a9aaa6/linux/build.sh#L504
> 
> Best regards,
> Krzysztof
Really appreciate, Thanks a lot!
