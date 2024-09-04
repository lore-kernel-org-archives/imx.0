Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8841E133D
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 17:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725472059; cv=none; b=dK0EfmuEAYv3tcVmOxzAMJOD2uERuG9Y+LGUb08i+VwxlmqcVXuZE6dvBo04AmmfbcqC8YI+/v7fvNI11jaeAwduPGP8fgLDwJ1bQOWMXSuBhkTEg5TztvcpJwoKaqqDmqXP53bEQFDapoq2edCTIo9JTXWOZ4JQ4QNfLCrpxJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725472059; c=relaxed/simple;
	bh=AoYwts8Ab5OPLrcSFhuWwguG0GQ8hqSCwvHEZa1WsgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUcFVWzvEVcdhmPITtGF6Oli3NJRkO9OaJbmtloBR5aLeWuPaY+SVzETuddDE3FUkVcd6ayIniiW/qXSORlZMktQe1998HklYQCJml0AISM3UysH39czJHBfHEmSWtDVfexy82HRwXYsI7ChR9pzC0hNMRlrNxb+iZcFfhUQ0mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKH9/Ovr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKH9/Ovr"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d8a4bad409so3033898a91.0
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 10:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725472057; x=1726076857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoYwts8Ab5OPLrcSFhuWwguG0GQ8hqSCwvHEZa1WsgE=;
        b=QKH9/OvrxM++MHrRTcH3DzcAfYzbgOmV/qEY+4k7UfjYj9P6aeJVu6Wm8aZSsnhzoD
         3TvAqHdb/zqT5ZXIxd21bhRJb9hkQ4iV7+ZJAKlA69ZQjs5EwfIDbzhXVmInUGEUL4+4
         4tQ6t+ajpCje9gaC2JklQ8nWl2wnlYWonkZfEjkAnUmk5WHgmgF5sLCeTjGeT8wseEBD
         aQcOzuXSWj7orpCT9teZi6aU8BMUjjRP6ySb2BzDxW0WkZZTyHY1VsnSA4b4xSiFiI0n
         IJryqKkkjHLiL87wjQt4qQHVOTsRizT1MuFChOro30t1l0AxZQulxQsptezEHRNmpbj1
         qUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725472057; x=1726076857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoYwts8Ab5OPLrcSFhuWwguG0GQ8hqSCwvHEZa1WsgE=;
        b=N/k/NFYv/syTP7fYJiQisofuOTXNu+XGZ1rNw5qIZ4oUMEkHX1o4SGS/DjIUlBWFio
         JVYmAOIuTnw3f1VKIUXMevyrrF4EQShYBE6sO/wIulIS1GV5LMCY81hRTwHLW6/kkagX
         8N+w+vMXNM/VewkZxOdYpYih9S9xhOA61IXw0ce4F3EhWdfGxpSsHWt9uNrolqaBiT5q
         malHj17Z4pKt3+CLuGlF+8tJEZIaBhUVYQSjkUYa5w+ybJl+AOXa1dV+XXM63jqN5dE4
         wo8mCl5gFJRDMVkeWT/fTCd6+tUnOq4bP3n6rGRNYH/pZ/zBkcqragmtvQuxz7Y4WP+B
         d5lA==
X-Forwarded-Encrypted: i=1; AJvYcCWDnB53/8haSPsP9QqYgfRqi9+EjSWXRIXJ+yeOEekKjKpCkLoG3yVoYWSY/LIk3GdU0Fo=@lists.linux.dev
X-Gm-Message-State: AOJu0YybiSmD/DLsnjCqJ1Y1POIOhVWsIIKFEnp/fJUOsD/QBLy90bq7
	OvxD8OsG9+acs8OBSUxBowTxg7kjk6ryiUGQGL3omtT3Ti/4EunW0XWTQfpNZcxsOg62r7B8UfZ
	Lr6285JHqaRoKZGHXAlnxtHeAvXc=
X-Google-Smtp-Source: AGHT+IHWiWJLIZjCGcB4z02cOv5ebjyaOvm0yg+2DiKxPuZ/QTuXOOZtwTxvS9SK6t14oV3Hyuqkry8OzNoIuM0woIU=
X-Received: by 2002:a17:90a:134b:b0:2c9:5a85:f8dd with SMTP id
 98e67ed59e1d1-2d89348f9b7mr14904268a91.18.1725472056687; Wed, 04 Sep 2024
 10:47:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904111727.1834935-1-haibo.chen@nxp.com> <20240904111727.1834935-3-haibo.chen@nxp.com>
 <4664d1fe-eeb0-45fb-8f4a-8299febab3eb@kernel.org>
In-Reply-To: <4664d1fe-eeb0-45fb-8f4a-8299febab3eb@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 4 Sep 2024 12:47:24 -0500
Message-ID: <CAHCN7x+q_pV24Gy-pGb53r2G+J-=mWy7STM9cW125y10JDMYrQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] spi: nxp-fspi: remove the imx8mp compatible string
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: haibo.chen@nxp.com, han.xu@nxp.com, yogeshgaur.83@gmail.com, 
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, singh.kuldeep87k@gmail.com, hs@denx.de, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 11:32=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 04/09/2024 13:17, haibo.chen@nxp.com wrote:
> > From: Haibo Chen <haibo.chen@nxp.com>
> >
> > According to imx8mp RM, the fspi is compatible with the fspi on
> > imx8mm. So remove this redundant imx8mp compatible string here.

We'd need to have the device tree compatible fall back to
nxp,imx8mm-fspi, but it doesn't, so the driver would never associate
itself with nxp,imx8mp-fspi.

adam
> >
> > Fixes: 0467a97367d4 ("spi: fspi: enable fspi driver for on imx8mp")
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > ---
>
>
> This breaks users.
>
> NAK
>
> Best regards,
> Krzysztof
>
>
