Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A2D1D934B
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118839; cv=none; b=L59GcGnBccGR8DfeB0gM7bY/AqEOfOlkTkI2Civ6OSi/CW5xbSfYiaSar9cySPLHkUZlKtFWtg8JruN1WJkwMlJja6Hj9QeNarKG5spysfL1I0+oQscui02Zjwecm3m6hFs4RAfIWBtqUHxipAfn97otVQWNfcMhjzJ5anKml98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118839; c=relaxed/simple;
	bh=HDLQY3qQ6e13iwTfkGPYuIXPQSA/x/amsdqW39bGlDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tkhs08jZXrz2rxxsxlNBk4ENxy48SVTwAwP7vNH4aa2Fh/rSLS9uD1/r1YzrnXVopHjv+vJVj1mrPhao6lKR59t976nfPfUjDaFg7SHSvEojiyBjMrQAVRyVzKh3pVspfT+U4CLkXloRNs/z55Dcj9/jFL6TUgVr4lW+qmfguCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqMGG0Gt; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqMGG0Gt"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso40072941fa.1
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730118836; x=1730723636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDLQY3qQ6e13iwTfkGPYuIXPQSA/x/amsdqW39bGlDw=;
        b=TqMGG0GtOLFVuueFUMhgolP1o0345aiW7lkZs87jt93Mi+JsXsvknVCLIOl1v/tcrN
         zFOhhDGC9LMN0qgtY+g4lPLVmCrqwjJj2vQT78UlpsgWhkHIjLkHJj74P5CKDSIIWdMt
         5cLKVW8OvfQdg4qxeaFe+vU2iJpU1YCyQ09zGiMtzol9GpgCb736SkCjF8So9hYcY+KY
         i1tTO79s6QYTLN8lwyWNmXH/0EVpkapkX5faBJ8DDKSbQhFf+6cJ8fUxfp05EkbclGp/
         nsJvv0KfEqndog6h7PzfW9IHry+6NzgDfHaVZBVpHcC9JaPMjFuUNLl4HFbrqH/I4pRT
         2XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730118836; x=1730723636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDLQY3qQ6e13iwTfkGPYuIXPQSA/x/amsdqW39bGlDw=;
        b=SwzyWQr7B+5RmMeyb45HXu+2yJja6WAIQwfxvCcDzSUvTuM+Tbm5TBCzDBw1WaJZEn
         LseplK1YeQce/P0fvhrw30hSWUQIieymEdwj8MZsdRJWTORUM/6atmrRwy1l1MX9RxgD
         GdFzlcxZJTeSpdY0oOLJ3OumttoUD3BrIhv6mBymeAzCWYaSndEyPgEixmGinnvGoorg
         kSJuqgzlLZ2J2K5s8e/JHZQefR5UmPsDUEGJUKbtREZQ7jrk+DhSXIpH3oOKH87q3qqU
         9e5M7T/O97cja5BJvcP+kDrn4FEjsiTb+m+jt+kVpDrjjCjIJ8PI97heDAPeoZeZl5rq
         DNTg==
X-Forwarded-Encrypted: i=1; AJvYcCU0mvpnLnxXIQuvsddcWTyUpz/XJO8nOd9zNlDAQxclZmSBE72T3yOnIMVPDRvDrjiygWE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8xcBtUoMCWwwqYH6GHDHAhbzk+NrPlSN914TmxUMePikIM0GB
	7HKDjg7xlzGMYJg0zQvJ3z/lIJUmEK7hz3/PTf6h/fJVjCNahEzKBB86S11RoCciToUAODPkb/b
	aelDMoJVrz7oLwnY8JbHHWmIdCSs=
X-Google-Smtp-Source: AGHT+IHZj/V8KLGee6BNlI6LrtJfPAxAxG9OQGWFq92wsn4uuuFerhAkdyRsDdmrgpr6My5eZvNh+rg/W6QZpCi0EqE=
X-Received: by 2002:a05:651c:222a:b0:2fc:9759:4e3d with SMTP id
 38308e7fff4ca-2fcbdfc57bdmr30593791fa.19.1730118835677; Mon, 28 Oct 2024
 05:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241027225408.195475-1-gilles.talis@gmail.com>
In-Reply-To: <20241027225408.195475-1-gilles.talis@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 28 Oct 2024 09:33:44 -0300
Message-ID: <CAOMZO5CR0=Vqd6v=N=Ymtsfw5F1M54tEYACpzk1HcMcP3tgAHA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-navqp: Add HDMI support
To: Gilles Talis <gilles.talis@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	shawnguo@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gilles,

On Sun, Oct 27, 2024 at 7:57=E2=80=AFPM Gilles Talis <gilles.talis@gmail.co=
m> wrote:
>
> The HDMI connector on the board is a micro-HDMI (type "d")
>
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
