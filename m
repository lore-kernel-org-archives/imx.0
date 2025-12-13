Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CB52DF12C
	for <imx@lists.linux.dev>; Sat, 13 Dec 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618742; cv=none; b=GA1fDoxQbyarc6hfpt2MYBC9TrYVevxEZ2SSz6kEzfMbQS/uDqquOK5lljlL/czNnwZGWvgXnby7kxJcUjkQ60TfEjuIXKepW+9GQl0TmKJd5VuWi+BngcAi25ajcbB5tVj76eAiBC6L+l2RShlF6Tdr9hPsyuUYWF7I4s4W1gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618742; c=relaxed/simple;
	bh=WXCphjCZZ7bGdKF2zta8ieDXu80tlgLfo65zMgmICU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2xZ3DSke0J9csslnZjuwXGC/jf32VYNqFquF/fdlbxd5JXMzA/zHvECyQyl9XQuMqCFGatNsIshGTOve0aqU/6/xe4mBavWgHi2H6io1MFoYlzRZb9vfYXvQnJcEXhXP0UwRecfOhOjThjAwgvPsNJvZi9O/NW1f3EVfNaNyYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3hxFvVT; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3hxFvVT"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so1217190a12.3
        for <imx@lists.linux.dev>; Sat, 13 Dec 2025 01:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765618741; x=1766223541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zg9r476TB45nezjLOKEc6mD8KJOcEm935qiWqcT++Y=;
        b=A3hxFvVTedW2EAnJfKlaej0A2UIVbJVovZHiwiIfnZVndQFcR8HAxxqNzzgGaq84NO
         bshdd4eR33vO4dkhudAACzLAfIJNM4pOI1WGeU2NyED8OZrda+9xVDuF77niA/masyRY
         PMstwQ2ZuEQ2WRqj+KITleHmi8iOCaSdT+dJaMAkljRUlhcNHS0EM5eRCTsfNLXvttUU
         89sTFO0Iwid1h9CovYze/dOKLjBSteEy1mYjIFoVGyBXQsbHJ6qkzBwb1VuGrzrW3tkM
         OPvYm1YzIuulAxSs0PIVYWeHOPvANcv0+fj+F4p6spb9shpez1u3huX6v08HOxrSxVd8
         JYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765618741; x=1766223541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Zg9r476TB45nezjLOKEc6mD8KJOcEm935qiWqcT++Y=;
        b=BpTJH8raqQCEcY73Qlr4fZ49UtqhjPIaG/2LYDw1HHhMxdaCn7zHIhLexjP5+Th0/y
         7jRJYj6wyykk2YOAf/AUr/jtK2fXNK5dgfaB0T9lLKG+gu1ykwfzNFrwj34yuJQETjNr
         I+ZTK43sY7JKET11nB92NkWDDZwriGY4qg9cgqtQxvnZp+MiFKZkW2GXHZtd6W645yJ0
         czF5CqxvhlXS4b8wnRcvogo8Qpkkkbd2u5caFQh0A9PqMZQ7uO1XWsahmZSBcrn9XSTg
         PHY6j3PsXS8qie2Sca5LU+R9vyzVyjChmlXPxNcB55BaivYDoJpKcYxY/uW7IA9U+vz0
         Xheg==
X-Forwarded-Encrypted: i=1; AJvYcCWqG06ZQxl42hZLToyexY4l4D6m6gtJgXqejewtH8qYEp8V0CCkIz1wdTSR+Kq8ruEUZBA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzODFFNryuq9Mo8ASk7/E3npMGTfHFwpeiErpqnD9LO61x9Boyk
	Mo/U7SjZnKqnoDT7py8+WUzeWfX9WrWi5ZNlpdLCZt6IucGIjXde3tyn
X-Gm-Gg: AY/fxX6qcHQQFJY6ZVb5318+ykYYHEUzL9E/UQYW+Na2Q8jAM9i/KwoFGSlnVZlSr3M
	CffuMepz6Ii6FYBCsen8VSGrH/Y1KUOGX/hyZyF97oq7HTSuh3gf0sFSx2/uF3EPYXb+z9RlDof
	FgjT4X5BZe0wnWmS0iKD3kVMb1OKniBJSHPTbmdHIAhLJzdPrZC3+o4DsRsrkKT4ODGGtSjGBUl
	jBU+lIIWv7jnXoUNnjnEwnu/e3bsLUAIpdSvHvu1DqbvCx306NkUUerMUPAtCXczXlZjiDcejIH
	RjVa+nKcv3w+g0lhIJqn/SdraCUxVQl7ReSqKkidHVCW66rueVRyACzkHMCuUWcu4kNkxBGdm2+
	Ux3RvBtJJWJ1ZjDtBOdtz2uSnRXq57qwYoHPnVDOp9rwYwGvUGgPlTZAxCTZoPZt/n+2u6Ur44N
	oYpGcIZcBGXybIaZlA75sBRcliUA2lv0F9sh6Fef44FznN0SV++3fn
X-Google-Smtp-Source: AGHT+IFeQpCPEXO4SIqFFkwFCO2Nbnyxy/OkiOZq+4VUC4VzZoHs/ts/r+OXgZeXSSt1eSbiFqYkrg==
X-Received: by 2002:a05:7022:e88e:b0:11b:af12:ba30 with SMTP id a92af1059eb24-11f34bde21bmr3505767c88.8.1765618740524;
        Sat, 13 Dec 2025 01:39:00 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3478:9150:d4be:149f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm25640060c88.2.2025.12.13.01.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:39:00 -0800 (PST)
Date: Sat, 13 Dec 2025 01:38:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Samuel Kayode <samkay014@gmail.com>, imx@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: pf1550 - Remove "defined but unused" warning
Message-ID: <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>
References: <20251210211149.543928-1-vaibhavgupta40@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210211149.543928-1-vaibhavgupta40@gmail.com>

On Wed, Dec 10, 2025 at 09:11:41PM +0000, Vaibhav Gupta wrote:
> If 'CONFIG_PM_SLEEP' is not set, compiler throws warning for *suspend() and
> *resume() function for this driver. Using new 'DEFINE_SIMPLE_DEV_PM_OPS'
> fixes it.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied, thank you.

-- 
Dmitry
