Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0454DA52D
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784743474; cv=pass; b=lj99mE7zXIJtuHIzUBtI9aFO99ou3p+ctkHffhP0DmVjg9AMblAH51eRc7NB1yLSriqTqJstwF1JolGk6EejkZI5KXRcKi4PggJWoiRfhDXfNXpz2qjcLiLmYC0lY3N4jd+hDZf1+OTWjzANUYRnBATo4w3F8HobJ/0U+cXHEgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784743474; c=relaxed/simple;
	bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDcfOYPcIQqukN9dGzBEUAL4rK3mDdhzI1KnoSwK7/HjIauG1VSMaXq3Vhw0PV7Qj2o3WjNZvdkr+SYdc/u8/g212ny5DKF+sj8sx5EJ8tPGLV9GTfXp8ysLz6cMRapwjL67FF/HW0xdNnY1BXwaMLg0GkIwBdayb+D2qZ5X8ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aUT6/n59; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aUT6/n59"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c01c79467so14451cf.0
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 11:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784743471; cv=none;
        d=google.com; s=arc-20260327;
        b=hJjKtbz3bxU5dA7uFwXlMeVcgEPTi/hPsZUKPLgm0PQFDPcMOCoRpXLwjZ5Xcka+Ou
         zhTKSEwbumHRVyhrimnZ0ZCXDQvVQRrcXCEQ2i9QXHv8DapQEDxokHHQrQ9QCcv3NzSx
         Bs91QI0Q7er1z2CBUwYnBOnx19qiMwG6Q5K6ifkimhMB01v/fZxpjdLCK4/I7BeB5sEs
         Ep/9L7Z1fu9T59ydU1stkE2PZTx9Loh3lDGJCE3ozzY+4FStttFWvav3ojF5p/1lGekW
         uCgcc5L8XXNus9bXBTCOXsOA0CEyIEVPT7Z00n0Z4cDEhijALAuYxqYo86Fu2C5pD29M
         n5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        fh=lD12Ejv9QkYsaFBETtTyCTWqX4c4uJ+gL/HCDIpp4is=;
        b=ke0cnz3CByVhiKpRkLJWmwvkBk6ImzXXZwrffYBK+icJyjzkVaf2RdhyyuAzZP7LtK
         7oZnLP38Fi+1KGpNUQ+OU43uJjsOWf1KgQQmBMh4+M3S6wiUlwvViTtqcEg6JzLbRc35
         imSOOBccKdH0dOpcBXl71ES9tWPOly+cDY+jqQCaK9cqKqnI1gnwggRJawzrEjSinAqM
         PStkIRiVczzVqAkUOQP5nWEMGCsAIQiQnNh+nUpfEGYdzkp4C2K4NecCJcafU4LFAbcA
         mH8tHbszBp3ncpUgDxD8iUt+2AVLRCPc97ga7T69oGakaLGzei2M39eQp7t9OQKHET7+
         7fQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784743471; x=1785348271; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        b=aUT6/n59VAgnW+gS7Mgt8lmtev7E7PL7j2f6FI3x69jKxnTouBJYRK0NG6MNoXLZk+
         79yQaDNfMZj655m9tEh1nVhnv4EGhUva/Pu3neX7Ho6ywfBSwz2m/AHJwJ6Jk8GOF/rD
         vnQb/MpD3ksoOtGF7orxe+jlkO447fO8iCnpCJGemSBPbwduM+3RvcYvWtE4DDKa4MNJ
         j4d9xsFSpzqKvnaUkXXLt8ety44oW8JiLDSc8EPGAERi12gfH5p/9bCedbe+lk/HK3qT
         U0bQNjiy617SKBjXPOCYbI7by69XVq1vX8AJxWivmFfNW4qLt/RyJtSN5vWeLBkJWDoD
         fRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784743471; x=1785348271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5ssgy8v1nToduf2dudMHLP7F3zMv+EGGsLhk51SR5k=;
        b=IPtOymUysd5RP+92Kq7sOWz7eA54wVfyEfwa0RCctwOZIZmFv8/4sWwuwXVDMoYVxv
         lEZbwUm7LLTdvfVDQB5UEmW7DdjdleZzlB1P7DK/dkV8CVnvsCoZeNWff3xiUTD4MZ5S
         tJQz0Jd6sD603SnzxduJyTvyH37uzw3tqzYPx2YvehlpC318MjUSHRE9FC1NSE773aHd
         25XJGRykNIEr+dfqgHfIOI5ePnKGg5obL4DbEAulGS3ukGzd0Jh2lun+in7qEOYJkXYY
         YBLSilYOrwglUftSZFQ3tmuntNDaqoPPP5Tzb7lSaREWQlqw/pVfyuB1IehnlYk+pqcZ
         feLg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+1dNL/gUvQ1tOE1cBfEqLW60AbMtzP/sCTFp0NZikdU4joYv2mOY6nCQxBByny2qj6fE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdP2UY1LNUkMEf0XF9BM91Nd3LnuCtKtw6W85cuzdGHS7KiRDt
	zjA/jZ0ulbnS1XH4XmNPQBZ/3OXOSdWnmDbS39nzXJvq/Bgzygf9IukM2CdqUlz9SZG9xWBwyfL
	9QX2sJSkvoo2L8UNJxxFMXG2Ac0MrqIuXH5A3mYeX
X-Gm-Gg: AR+sD112wm6oIjA4lkW4siSySVKkiuM1Vkoq/X6WrCabWrvYHBoulNDhbB+JouKQKrb
	L/iWbTXZlaqZhVsJOnOlcwihs7LB0giYDTPlinpQlOAWJZKdOhDv5vSEQae9J4rH0+gbhxNrV4k
	8rlWIKc5iNQHDC9WHfj9efq8etKXVwp8sA/9hb6Vyy6vTxKHMUCDD758edB6ecV/VCIHvzwVhM6
	q40VP/uXwyvU+b+VfL/f3H1RmLmFgzqQvOMYMhoWmFiEk8XXdPRJbwCVmM=
X-Received: by 2002:ac8:43cb:0:b0:51c:935d:8d74 with SMTP id
 d75a77b69052e-5283be3e9d4mr374341cf.9.1784743470255; Wed, 22 Jul 2026
 11:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
In-Reply-To: <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 22 Jul 2026 11:03:53 -0700
X-Gm-Features: AUfX_mwbxqkU-iAMaiWQ1yNey3EgrzgXznb4NhUQjYMjtNDBUtwxFYY_8mI2M90
Message-ID: <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:47=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> =
wrote:
>
> I think the issue might be a parameter mismatch: in C, the pointer is
> declared as taking a parameter `void (*)(void __iomem *)`, but in assembl=
y
> `imx6_suspend` has no parameters, so Clang generates two different hashes
> for them?

As long as the C prototype for the assembly function matches the
function pointer type, the hashes should also match. Can you dump the
hash prefix from the OCRAM and compare it to the disassembly of the
call site?

Sami
