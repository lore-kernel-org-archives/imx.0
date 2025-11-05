Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3062C0F79
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358140; cv=none; b=PVJImVwMtAYlAZ+3WVc8LI4VVBDjCq/0STUPH11eV69lzkTruij2qh8z+AK8qOUbZ243TST+ycQHOvuwrwCYdvLxr9OhFDXCVZs7BPCb+3xylAef3bqsRcVvkXFigtxniPSwb6PF/OoX0LRDtBhHJeDDFc72+C7HATekRDoNAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358140; c=relaxed/simple;
	bh=Io1VyLd1gRAuF4noSMJeCvamZeFl5b2WHdevUDZuHy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urjEJ5PWtjyqfKkBT708qP5HgbeAUXWQj6cZavnQorO4WUfy0xJk3t+uNDHJNcdfa/qxIjTvGfQdrj+4mvqYJmrJh0XbCunpZcmzySrqTNM8TOT1H0BJqeBF8ZLWbub2u+PA6ER0svOs10MbdlJQP4JlhnJBp7f9saqSO7UdG9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egp2lDem; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egp2lDem"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-594259bc5f1so3188116e87.2
        for <imx@lists.linux.dev>; Wed, 05 Nov 2025 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358137; x=1762962937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io1VyLd1gRAuF4noSMJeCvamZeFl5b2WHdevUDZuHy0=;
        b=egp2lDemfpz7hdMaMK7p/17yGECFF6x8jFB0WbVT91zptdYEcEqCegIL0HSTeYWVMH
         QVRJns0vTvopVE/CPfJaYvZmr11c5tZKcLoKJrG/eutyLQUzRcDiOSwc5itY2u4Rzf1S
         coF9ogCmIU8lRNpZnZVbW8dWisvyKAQUBe8rDXxaEvqz+IvmbwAFkJUJfQ0/j+jgCR5B
         uhtFO9N6OsUXt3tjyE0uqpW+xOwzHMUbak4DV4ZshT9gJ5npK49qQwtmnOz4R50tDrkY
         bm6bukYqoFp0OrEtITA1I/67kE8JdB2VsN3/oXojzhJmIsbUpq2Tb3d5MEl8Vd1KCtka
         07eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358137; x=1762962937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Io1VyLd1gRAuF4noSMJeCvamZeFl5b2WHdevUDZuHy0=;
        b=WrxaLaKL7HgYvJNWW5wmQzEaIj8L9E8894NvdlUQveOHcM3jzLCUxsmHDX/vAqMcgg
         EFhDOecNPPzhMVogct9kP0hp1gN1DQXRYQErYPKd5Q1NjDiwcOTkZwpWELBXQZZL9cU7
         qnYK4cQ0qNVG19O52MtHXnndZcVMKXCshUGqsCeuFRSy9wbNbM2dCGNgPi67RuJZmgmK
         FY9jRWKr9hjdGQ6kVKzSfcmpZYIz/cUobQALyOT8MIYBPkDML6X3uQOoDAZy+nSfPNfi
         PWAxiM25EV4EJXgba5va7LLTZZUZncNRthXagugCwCBV84kuZdBLA9BbnxLduWLjr1BX
         pYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmMOfVj3DXs6di1BKgLPCsjNHYM+t6wg2uFrjm9JC5bJQQcI1PwUlC5JWSoW8NiVgyTSo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzn9+iciPomeQugfSHe0TQ1odT5NhIACncsxnPgAgsgQIp72XA
	ynHNsIpiquqIXAhBo9p9nIheGjKcT3aduux7SlZdPUV7/dIim5dErBCC0IjUQUm48yQxd900GG3
	NjQLijoWSqF/3+DwSzwkmLVrc2vQ3xQc=
X-Gm-Gg: ASbGnctjn+SXUQO6yXQCAZgDv2LOy6ULUbLaaru+BbXSembQWSFzLRqV8AWsmAm3N4b
	C39tfD72T28Wcsqo6MybLZ1M8ScjRQKZ+ZUFWM5C1ljhSi+SGRBTPBw0Yt3CgOKL+DYxDWNIp3Y
	kBttPFMt/GbO4m/Ju1i46/05SvkL0TgBk3EzD1kzRcIJ+I3/l/p1nOOoG3d5shqif90no7s5IZv
	nCdErAjhfglVN6LcqE0Dej69CWrVEwKHiMJwp/SyD6yolDh6TZXUT668dN+jgJN1l0JDbVPB/Dg
	ERB3aDAgEA99eCQD
X-Google-Smtp-Source: AGHT+IEKZD2r+A6glfOrMrg4LC6QbMe/1oJABd/0/CzvD1LhjWBFWqHF/ZzZ6hEZaZ4L0CrW3eHh11z1a5+Hf0RYLbg=
X-Received: by 2002:a05:6512:1390:b0:592:fc68:5b9d with SMTP id
 2adb3069b0e04-5943d55dbe3mr1269961e87.10.1762358136484; Wed, 05 Nov 2025
 07:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105152555.1992513-1-michal.vokac@ysoft.com> <20251105152555.1992513-2-michal.vokac@ysoft.com>
In-Reply-To: <20251105152555.1992513-2-michal.vokac@ysoft.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Nov 2025 12:55:25 -0300
X-Gm-Features: AWmQ_bkzywn6dkKu5hKn_kdsHkqaeTB3gPh3L9WBztucxEsOta2CD1J3nctobCE
Message-ID: <CAOMZO5AKmKWciyF7-f_mVfJWdLB1rjh_Xi=BhkBAcmV=cJ-nyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6dl-yapp4: Model the RGB LED as a single
 multi-led part
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 12:26=E2=80=AFPM Michal Vok=C3=A1=C4=8D <michal.voka=
c@ysoft.com> wrote:
>
> Describe the RGB LED indicator according to the reality - it is a single
> part containing all the three R,G and B LEDs in one package.
> With this description the chan-name property becomes useless, remove it.
>
> issue: HWOS-816

This issue notation appears to be an internal matter. Please remove it.
