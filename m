Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A925225760
	for <imx@lists.linux.dev>; Sat, 23 Aug 2025 19:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755978733; cv=none; b=PC6kUkk0SSmg/QJnrBNYxSlstf9+zB8RujDCqWHmJBvwKcLR5jZr0/nXUCeLkhuy76OKJRXuOMoe3FY6tCk3T1g4CfNaWNRCVGr2ZqcwwDjqpiByKtdQFxSbfgLGJQKTj1u1FXC1Y5xVWAXIQb/LzzV6VVKqVMdakVrBxjkouVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755978733; c=relaxed/simple;
	bh=b6ao/xxPWGUmNWThbU3dcZInXNPwtuZ2aciA8jz9EJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPjHb9G7hDTYIUV/zax+Ux0Ab2vLRb8u1BhRWs4cSx5StxOfrwLpGkosWI1TZJXKl0FHB/NoWKJguXqk9kmQUdZTYXPBXFAhV1x4nFqFsE4fmQSomdazwQMpszId1p6RSV71lOl8UlU0OGRM5IVvMtkZ6scrvogjwAeAz/wLzW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBRlSQ+U; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBRlSQ+U"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55ce521e3f4so3450385e87.1
        for <imx@lists.linux.dev>; Sat, 23 Aug 2025 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755978730; x=1756583530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6ao/xxPWGUmNWThbU3dcZInXNPwtuZ2aciA8jz9EJQ=;
        b=bBRlSQ+UWyBaeJj7VLr+K2rHUi7b/dGfAaciZeJoCLExQJslGNXJ7tRYAjQljB0ApC
         8AzfGylVxJaDhsKhAURxLeDL36vCotX9gvK5eapu/BPspNBkZ7Mr1jwqJJOl2CcyirFb
         hXYovdMXQ72Aqkq+XiiUrwkbZ1IGjYkP+uc5A3mS8ocaFeHrp0U2Tmz+YYlKHIS8H8jU
         OZUYoMEZz2NuJYw876sxgvRt4PGBGBNBTxmaiCF5wCq7bPWp7d/tQyPCs56/DBdf6qU5
         RXqZ0py1YjuxvGCH6hw0ZGfcUrabu/SYP3P2AOxnGOON32F8v/QnctD/apeqCnyefDxW
         2rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755978730; x=1756583530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6ao/xxPWGUmNWThbU3dcZInXNPwtuZ2aciA8jz9EJQ=;
        b=IEUum1+GwnplCK3uu0tFVIiI1jHea8is2mtk8NSXZ92jvYEHX+eJUURJnB7hdp9ODO
         t07EjmcYlzr1VDv5wPrRN5dn2xMwdyDTIXsQu0p2jCRYH1HZJc0s3HfA0w+tHw8/JFi9
         RCEkrafiA73Ip+e1Q9QfC3mkCRFjpt344EMjrbU/zp4teMk80rFNCuaK7rL/vdDJnHCe
         mNxuH9j4wtuuPdof4aEo+khXp4LJeFHBMTrDZR6x3XK1w4SvL7vux6J2aYEgKidmfrMb
         sPL0WBpqi38vhGQySAVe07FkgUIz8jjgB7PFyoEAGC2OHqVXje3K1e81ujcMdpWjeoWs
         Ckdg==
X-Forwarded-Encrypted: i=1; AJvYcCVYiFW5Tw/IK21NWCKCrt6k4OfSJGdvi5nbofYKgKkOYvWLnhor0PjX3uJa/BSjHx+Pwtg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKEosEzijXoQ2/ezDR8ftCWt+xaNEpez7aT1YVfbxChYVV4rOq
	khsM3Qup/p4uftNZ6JTp77YEKkevIS/zkbDhYMFwjBTsloot+bh0IJoBuw1bK4bp0K1Tl5qZy10
	5WHY0nTrU26DmpqqYYIAxcaEdnIzt4pE=
X-Gm-Gg: ASbGncs42cmky5Xb+TTXCstzxXdYjf6Z9sI+HS4ktqCVophDC17iZBDSRahlb1aUfBB
	FnTfiQ7OC01E2VFsB5Ch61hiwgeDfECGhMARrpBipSYYygM1uMGB0gmt0gnNYLkLPwszp4zQ3rP
	HfuxmxtCy+HTdTiStvNO/Fr4FDPNYQBDa5OruuZBKXlnnaCnwEJ0awvuq6r7Qsg/LdgqDNXunSN
	EvOCoz+YmtHK+Bo1KZd7SOe4tPn7ok0ba/ZjSE=
X-Google-Smtp-Source: AGHT+IG+8Kkuvq64IDsQlIP2OZRaUgDmETadfu13CGBRU9moiuJRH4/RpaO3xxJnaix0E3/8Vj2JxqOjvP8l5PtZ7Uc=
X-Received: by 2002:a05:6512:31c3:b0:55b:8df6:ebfe with SMTP id
 2adb3069b0e04-55f0ccfe43cmr2539674e87.54.1755978729373; Sat, 23 Aug 2025
 12:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250822175830.91682-1-festevam@gmail.com> <20250823-altitude-scone-fe104905ff48@spud>
In-Reply-To: <20250823-altitude-scone-fe104905ff48@spud>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 23 Aug 2025 16:51:58 -0300
X-Gm-Features: Ac12FXzyMcqfz4Llso-gdfdx_Tp2qQ2YGU7hdiuJQIpeDgkHiJQe_2YE-beP6U0
Message-ID: <CAOMZO5Bxaenzy73U1mXQLM4LYaE_B6FdB42saKrzG3pTqETiHg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: ata: imx: Add a reference to ahci-common.yaml
To: Conor Dooley <conor@kernel.org>
Cc: cassel@kernel.org, dlemoal@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-ide@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 23, 2025 at 10:55=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

> Same here I guess, you're allowing a bunch of other properties now, what
> of those are actually permitted ones for this device?

Only 'target-supply' is actually needed.

I sent v2 documenting 'target-supply'.

Thanks
