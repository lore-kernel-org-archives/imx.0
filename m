Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7011885B5
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725362139; cv=none; b=NEwyrEbeHGSIQiyf5GDW29+hTt7cL0tVTZlxYoYFoVh+cEZt1FL1MMBvc/DiJU1JeMdTyJm1PiwhhULJVj43tVuY8UOagAz9pZI+OLU2BxvPruCGiCpVwE0LDdL5Woo8UFN45qead+GPP7PE8adaYTt9SMkn6yfwYdJ4vH3Alfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725362139; c=relaxed/simple;
	bh=BqJPlt44MeNTjunDONHtThoDBK8zbPy2hRTgHU608OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6y4GvWY/c3hUWrpUhfVcjQjcqN3DfebXhAc97zmQ0hh3Xb8L3JiNKw4gTTErGtYWqw0FmaECoYuJHzwozl3plCjub9Itr/oOSGmaPWU1oKTMe20cOEPUbKDh5VtizlVI2ZyYmWNKpSv9xz0lMU0uUWBIMpgySc2j4t6iE9Ii5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhnNMDVE; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhnNMDVE"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3fea6a0a9so45703571fa.0
        for <imx@lists.linux.dev>; Tue, 03 Sep 2024 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725362135; x=1725966935; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqJPlt44MeNTjunDONHtThoDBK8zbPy2hRTgHU608OI=;
        b=YhnNMDVEbVvfnnP+2+ukQfdVdYumz3G35Kq4cDCBInOp3IhGW0tA7/kHUpQVFcvZW4
         uAX2nvIYyxQURdgpxwuoU3XVyMJQHiplmWZ/BXpjvRFBN7j+kBTY6jsJhtVeGs7SXkCd
         eX1k3bqll/LggJJ5yZv853Dn98nBSaWm75ngXd8b17qAmkle6j6cA+CvW+rpnW4pnqc2
         LD6uf8zOUe1w70gx+ODmb4T7I8X7yl6Q8/1n7nd7Y60dnSbg+zwTbXd8Gh5V54S0qZTj
         cMMSNfxvsGv/IpE5Wq3M3I6L6yd08XEbTd+lNq3H9OmKxvHv247uPva0WK5/0VGJ+w5U
         AS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725362135; x=1725966935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqJPlt44MeNTjunDONHtThoDBK8zbPy2hRTgHU608OI=;
        b=VwuoqnrUuufUKXa3tm0/e2XTksobEQCOH8ROcaaxvTWEV4gAyGAEnSeB9pc09gvcmw
         cIvbWRq6E1qiCzxlUIVfbqzrZvjpwvaIpal5pntjiw9OWPZaxK+C7VyfLkTMT6SfHez3
         lYRCl0A9aktmTg101t/POOd0lToV5rXFly3JcUPdsRn634xZSLE6IAc69yjWI0JBoN5X
         7umCJWPGMmu7FR7h+B5IKNJTO2sj9pO4wySz1g2rLc3csU3BrNVTstoUmfCwsJaF2S1b
         Tm1FfqYnfH2Z6PE36sr8LUCBP3GEMomkxsyy4CWrJKM/xt0JY0OnCPo01yPiLr4PH5ml
         IEag==
X-Forwarded-Encrypted: i=1; AJvYcCW/QxMAlOGn4Bm2ySdNB/kvB1bckhnXzP5ZkY4B5atDE8E3lCzoVlNdbqQvt/sAb58+QL8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzC4n99uD/NJdccvi00gPv+wyeFcYDinkhAIQwzQMuAqk9YHGgC
	vebXexgNOFJqjQ6RnpV8/DnBP1uLUrSRelLBYDKXxIs+axLxoLhNIf3lYP6Y6cvrL7UiLz7U7lU
	O4zdsWhSW5NmwmMNrTb4lL7qeMqo=
X-Google-Smtp-Source: AGHT+IE8SjM0Ms3di5cXWgcpB7iUkzE4YJxI+Ckuk4QQ044JC4VZuODzzCPoUd7IBUnkokoQYv1d6k7FzBjdigKSPYc=
X-Received: by 2002:a05:651c:19a2:b0:2ef:2e5d:3710 with SMTP id
 38308e7fff4ca-2f61299bd88mr59721361fa.3.1725362134721; Tue, 03 Sep 2024
 04:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903093911.3235306-1-carlos.song@nxp.com>
In-Reply-To: <20240903093911.3235306-1-carlos.song@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Sep 2024 08:15:23 -0300
Message-ID: <CAOMZO5C_dpYGYvc=KE7ackdJH2RfhrHP6_Z=cxM=9X+hX5W8Jg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx93-11x11-evk: remove redundant "sleep"
 pinctrl in lpi2c2 node
To: Carlos Song <carlos.song@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

On Tue, Sep 3, 2024 at 6:30=E2=80=AFAM Carlos Song <carlos.song@nxp.com> wr=
ote:
>
> In lpi2c2 node, default pinctrl and sleep pinctrl have the same value.
> So "sleep" pinctrl is redundant and remove it.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
