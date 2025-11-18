Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547F36828B
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481590; cv=none; b=jeXM0uZ8D148//VM+1NvjRegadpCByGj/HFO5lXJjGkp/PbH7T+RHML9Qpb3wH6sqMLtiGoVX5oMbCwI2eEFCW8BVLvSznR7OUgZjO4oNCr9Q5bMFrs8wyaiuaYrBjkrmrvSSL5olrsuoGI9Lve+FkjEs0/jClpj62ZXco94cwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481590; c=relaxed/simple;
	bh=QCkD8d2HX5temq0Rl9bOMIilfrQLk0hv8G6GhqRjUe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwzLw7dNeB25KSqFGr6XFJr2QQmeqhzNdtf+F2BkQhbj/KDOjy5r2IRAIUmWxbXN8crUL7xsJjn3PQ8XNeSBD5CMY8dmeMFsqqaE6eTSKQEUddKQWiRuWY3Ga9szN2EJf5IQvViF4nOkJRVKCAE1BXT48mX8M7f4dx2M3a/XVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gk8/Jz3J; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gk8/Jz3J"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297f35be2ffso79120065ad.2
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 07:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481588; x=1764086388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KoAq4ZOnT/rp2A2Dqykoq7B/YkJy4g18nEwG9bbgTCo=;
        b=gk8/Jz3JRgguR9fTNF3LnMdgoJlWvZhHA/OtX/3bgD7qcoC+5qqldd8l3zw7lU+6hn
         03BkH7hwHpur1zSB5zelCZHEL0gb6ADI6HG87HFd4yjWteqM+1NlTDCzeyDzJAIVPFB9
         WWssax90Ti+SbATzd/Q4reFZuCcl5AngVVvWxPHlo2QbGuwcZ+OZtVjionF2YKuR/hfu
         stGx666wq2iOMGuvzUHwBtko3GufaVvo/uqnrABBaonhvlg4neog9/3CInzXNHoghvP1
         gW3sdZFPsFuguOIssrMzcue0ucwvIcRs8FcdsfYkzxXQFjjONbvfN7iiu/6HglHhz2Hu
         zfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481588; x=1764086388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoAq4ZOnT/rp2A2Dqykoq7B/YkJy4g18nEwG9bbgTCo=;
        b=uiW1/hPaKNUKuJGQFW6Oh46yKVo9XXaLHwlrjX2ZVLEQLPUAXJVOHJ828xIbN7imWZ
         puQ+4SuCQLbQvQIbkbB1ztldxj9kjf0Y/i3FXBD17I11aqhb9ewgglmVwp5CUraCG7E3
         k0cwIHs4eOlG7XWunZ+0JFsO7d2zh5krR9r/4HFof6QfEm4FPXdrykaCTfCpv+9k5aKc
         /e57Mk9Pe+8VtjNUaPIGo6+sSdVIQh2VOrAM9Mbs/hIIrEM78iot10bwKBj70wIwCDxo
         Iq76PCWRxc+I23oT6xOumBxAkuojwrEhoSDeWHiCB48OaoRyzcGVDhEzjw7SqGLXE3cj
         WC7g==
X-Forwarded-Encrypted: i=1; AJvYcCVOyOAe9Si57y7afbBQ4yE+WPv5/gV4HE+QesP8QVXeOCcbgPv1/R1kECJ9mrDkaGYvqzA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5IMCCMC8WAMsuCNUiR3opT3gsy/JNBzOI4u/YkFcNQKU4p6T5
	gIZ7oB4SmZmvuhmgegHA6gKR9d96Wd8lX6RW2rvLRW7bCxwnJeHTguZTX1LkN+wi9Q0=
X-Gm-Gg: ASbGncvHIALQWWbRTnzS74Vy9SWzk+c1vJoZFnuGc+O7QNe5h4UVJnr84sKBickQhqD
	aWHS7Jo/S/btShqnkjFA6fVGkcaHZt+Bevhamk7/tiV85Bu9bvhWDleygPVqD7QkyKd/+Qcz88G
	QSFmSK6GWhOc6VKFebeYDuhmX8m0t4rNxqLMKuFuc2kkybtiNdP35OLa3YFU2fRd/s4rbpkxK5C
	tmgnhIo51Fi5ZE1oRw+BPi3MzWP5xRAl6eIQ1GT8wa0sgsZ9b5/wEyQ9XpqAlSanang8BtckDPI
	wAaGD0sOBlrV4HNkAOGXQR4G0G4dF8JhqB2Iw3dmXXp8Sz+r7Lxp/TzNSipcEZgHpcgmB+qsGM6
	rmsxaTgZGkZ26yHDqOdtYqCQv095T06ht2IKb0MIO86zzwGUzYoiPoY1qs4PX6H/s//6H2lZTd/
	VehjotzxXjeT737dzYcz4+54tw
X-Google-Smtp-Source: AGHT+IEahplMq1XGZhU6h+/qGLbY8HO4nkNbHfdqTlJ5mF/D+bvz3FgFZjG7PWcQsGuNCS0ImKNuZQ==
X-Received: by 2002:a17:902:d551:b0:295:9db1:ff3b with SMTP id d9443c01a7336-2986a6bbdf2mr208106695ad.6.1763481588326;
        Tue, 18 Nov 2025 07:59:48 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5650:f012:168c:76e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c0577sm178835205ad.78.2025.11.18.07.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:59:47 -0800 (PST)
Date: Tue, 18 Nov 2025 08:59:45 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: corbet@lwn.net, andersson@kernel.org, dan.j.williams@intel.com,
	cedric.xing@intel.com, pasha.tatashin@soleen.com,
	kevin.tian@intel.com, skhawaja@google.com, yesanishhere@gmail.com,
	taimoorzaeem@gmail.com, linux@treblig.org,
	arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	rdunlap@infradead.org, daniel.baluta@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH 0/2] Documentation: Move rpmsg.rst and remoteproc.rst out
 of staging
Message-ID: <aRyX8etm-Mcn_94F@p14s>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114065746.901649-1-daniel.baluta@nxp.com>

On Fri, Nov 14, 2025 at 08:57:43AM +0200, Daniel Baluta wrote:
> Try to find a better place for rpmsg.rst and remoteproc.rst files.
> Having them in staging suggest that rpmsg / remoteproc are not mature
> enough which is not true.
> 
> Daniel Baluta (2):
>   Documentation: Move rpmsg.rst and remoteproc.rst out of staging
>   Documentation: Fix filenames for remoteproc/rpmsg
> 
>  Documentation/driver-api/index.rst                   | 2 ++
>  Documentation/{staging => driver-api}/remoteproc.rst | 2 +-
>  Documentation/{staging => driver-api}/rpmsg.rst      | 4 ++--
>  Documentation/staging/index.rst                      | 2 --
>  MAINTAINERS                                          | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
>  rename Documentation/{staging => driver-api}/remoteproc.rst (99%)
>  rename Documentation/{staging => driver-api}/rpmsg.rst (99%)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> -- 
> 2.45.2
> 
