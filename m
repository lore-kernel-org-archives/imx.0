Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA1537F8
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589908; cv=none; b=cmshFUquyP8HX4JZhCoKkwlHPve1C8s10zB3U3ukhuf9LqfV1AYzDr33+Rqofs7OvrUAoQ0rqIITMiacNKbNgiGg+miN635eDxkm9l1nmcvtzqfUmR9EzBH2+5OUDJ/R7Mbbk+y/L41Uw9fX/vsluucx3z3GalqXZ1exY1juDbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589908; c=relaxed/simple;
	bh=tcriv+/Nzx4S273xik7czZ9fG6dM7aE9NlAHA+tSzps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTDtftXyTPBFsZlbgPGcMM3xcf9MQu0jtIC/3qtPA65SMRIe5U7wK3hHZij67GL4G5vsFglVIuxh+NFmsJLk+cIUtZpuhiBg2bK5frppLomvOtfSZR5HcYFB3S9Dqx36NQ5iwA8WIOR/OwvBzrLVNOpAkfpjMN1roqX3XgK1Lls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdXO8htr; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdXO8htr"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30effbfaf61so25016771fa.0
        for <imx@lists.linux.dev>; Fri, 25 Apr 2025 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745589905; x=1746194705; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcriv+/Nzx4S273xik7czZ9fG6dM7aE9NlAHA+tSzps=;
        b=kdXO8htr8Vo36PszE0uXOTu2E1RLU1YSPY2PtzujeHsXnNKSZhetYDiBgY/5r/xAEo
         Uy+z2zCjcXrjxdqvf81dT2NfcArNPHqdcDoYx8Jj36sEm7O+FL0AhcUFpLXNT266YkvA
         IXbJeRpfCoFju2bpwQ98iSy+YQkuVmXYIrfGCa3/0S50zyg5RhrdhrTYBV7yD1eg4gaj
         WZEJDYY5LX62wzQLx88Wj9ilcAGF0xZaPMMgorvJiIt5kgzZn4PxNQ+nKFhJpMMMkahO
         yEXMmorp87qH3O6NsOGUAWT9MWSTXfWbmXNwEBBAAPgTOnylWCdjLQx3p25kt1ZHu49S
         ii9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589905; x=1746194705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcriv+/Nzx4S273xik7czZ9fG6dM7aE9NlAHA+tSzps=;
        b=cKodd4Z9c0WPIsNqJCx4HU+PM0F/5u92ccpBeCbm/H0EEA7peEOqk5uRNu0ObuhC3r
         d1uW+dHpzofeojj/9+SqCLbwF85lV1I+bjdYpXgM2NqFBZlu4lJ/HJMXh/Z8Oc3KxJcI
         OAd2KMAM6wHj7sgjMJ7cRSB5nWCagQQxmm5+NfobO0AMuUKMOSSi9GWC7sOYVX5KXiw+
         gi4X2Qy6xgmwX63/qs1aG9E3489Ez7JBdj3cCblj494xHEr4oDvn5r5szRsyJtjA3yVw
         Fog5E9mqvi49B7RQOIiikcaf7vHVCg29S0eqoxBBURZDvXQ6GZhiE6n6i/fiveuwGRAR
         x6aA==
X-Forwarded-Encrypted: i=1; AJvYcCVlpKOXhJZGlXpNZnc+L28B3iVWhafmxnn2Y/+Ytu7M45xHPxYWMFrcoas7DGHJ3/z2O04=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7o3gSkCi7mFa+6XfUfmQNvKcR0Lc+bthu+AMP8xJfvjPasFa4
	zkdObv9xjsihS+K58f7ei83aKM0+GLbP0GOv2IUSca76Rk8IVhRfzZPp489ohz6Bpvh0rDBR68U
	iSa81GnRw1WfrzzYLB8XZtcqe6vU=
X-Gm-Gg: ASbGnctdoBHqFhTDaHSdItzLM1yRMcXPnm5eXIaANIIMGpyHmR/FUT448UGMlm3T8lo
	WIIdQu9j1KnT1l7IcDtFSeG7PhgXaZV5mrOwmnajsgT7QITWwQlecMMMEubZFgxYU2gugZi3Pwk
	v7L/qZJAO6ViMVMKsJwswK7l3NIRS242SV5YeLuDkBeFN0vZcCwO9O9Q==
X-Google-Smtp-Source: AGHT+IGbNXTCJsd/v72rtI2+cHQDztvohzJr5dz6aN/tePTwECFs4nHLzaitujZr66nLWZDPS/2mWZOnrI3HOKGrkSY=
X-Received: by 2002:a05:651c:2122:b0:309:20da:6188 with SMTP id
 38308e7fff4ca-318ffdf116bmr8233811fa.6.1745589904734; Fri, 25 Apr 2025
 07:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250422115055.575753-1-xu.yang_2@nxp.com>
In-Reply-To: <20250422115055.575753-1-xu.yang_2@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 25 Apr 2025 11:04:53 -0300
X-Gm-Features: ATxdqUEgpFP6h3MmeDD8gkXynHJJDhY21-j6QnWVvr_oXvPD0yYjjdca-jszP7M
Message-ID: <CAOMZO5BrENeZ2A1erDupCTfMypX-Pd482o1N1eF+wKEL3X7HZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, 
	robh@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	swboyd@chromium.org, heikki.krogerus@linux.intel.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 8:49=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> From: Stephen Boyd <swboyd@chromium.org>
>
> Ease driver development by adding stubs for the typec_switch APIs when
> CONFIG_TYPEC=3Dn. Copy the same method used for the typec_mux APIs to be
> consistent.
>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

You missed adding your Signed-off-by tag.
