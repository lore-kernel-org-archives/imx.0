Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5C25228D
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 02:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772764747; cv=pass; b=qvLDHF0YN0iJnrNkOj8doEalyPFrkPtKTUA2haGpDyYWUuReRjl65g/m91QKDQgWWoVWshDKn4e3v6DqnZiIX0705FPRLMP2KgF8ecKzgv7bX0Wlm77jdiNhshbDZBhdXpRIfrO7h9kWbKDD29tiO6bZPtAQujwwCQGj+slZkAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772764747; c=relaxed/simple;
	bh=ntNhpeJKHj9Gcz76mVeBjjXdVPDLd/l3flMVyUPRa+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJSBfDVAdzgA4lmePnHJuWEQEnX3taWjvzd6SM+UmtkzYU2gLLJBJp0LK5UofMrpbLhMLatcwoN5HpswnKRz3132ounP6H18QPqvj+9/WUlF4EOUH3K3hRvIG3WOTsUBKulSyagqjJhs8CfmP4v7W3TaRtKsjz8zQtDpDjJixU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqFFAllz; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqFFAllz"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso1566347e87.3
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 18:39:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772764744; cv=none;
        d=google.com; s=arc-20240605;
        b=fkgx9RwkwMLSzPzadfLP74JJkzVkNi4kqqpNfqB83ue00EP8HyIISdwlOkJtO6MY9Z
         8KXLAhEMxB6qiNBjbS3MOU9h9BC+kZWGkmUrH9Lol4hehCEHxyoys7W0VgON4TPWYKN9
         UR0TiFrkBWtCGEieUcK1nnlloINizQdVPRG4Xj/k6jgVluC2DOTYDFdYSCbUbveeVDr3
         SAOCRa9/JsChSuJZ4rMucth2jFl+gDnef//O9K3+Kwe3OM+367XMRJG1OknBIdZbk79V
         vZ5vwF0PXoeCw6peKoPbOauZ6tVwt6Oma61sCfJHLAuauzgcPDyhWRrbi8hoOe6N0UF6
         kp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        fh=esZUp30NHDwWtZD5eLSDSKQNGaiByRCFoHDgXX6CL30=;
        b=STBsppanUjDp0crfg79WTSj5Mv4NrojmDoUtxh1m06JouszskCLTrHFKR2uKdLCAOi
         BhzLXJFwmp6yTGUR/8qj3lWEkVguBDfD8OoBjcUv234Ttgx3ps06Ni6Npwekn3ucHlAy
         iuBrU/bAY5C3rifEmv24X48GkMf42KX+eBFQuo1qzhsOL4tllx7ELfG7ScFsgOnti43z
         0azwCOEwX4vNiB6zPBMA2ua9gs50D7IpeT8EpMLKB9RKsQr7lYhkJYYe3dS9UXJyB5Md
         jUvvxGIcXt/6KwCrgPAwjUYqGtjuieBGG7Mck9st6/jDefqB0WLdPRZbUwgV+4847qV6
         IFjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772764744; x=1773369544; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        b=GqFFAllzB1QzWgUJLL/EAZHffumrO6IleL9yAN/sBribkG+6Ppty5zJzfL95TSD7Po
         dv/5p1Ar0NmcVWww7fCKCcvp3c27MtjS8X4P3nYW91sbYDeV5IEp7ZJ/MOYHkAPhbjs1
         JBx9rMlJ6IpbIpnsdrsuzBnBul0OaBemElgl8JeWsGzRiTFzMya5t2T/gJjqKjY/hEeh
         j85S++AwLkkUaZaTXbHSS8TIgSMuFPcfLoNjP5YmsK3nY+wiXsxRtyDbvteemsYkdeA3
         vtDQcELECDs5ZSGxPuxcA8wCYAQEyxuvZ9C+nCxl1dK5PPo/on6Mi0pBVKgv8LhnUy7D
         LslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772764744; x=1773369544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycJdScU7VQZBgNX8C+iWhq//vtAo4EZ9U6PbAPueQDA=;
        b=I2vBT71qxqckSdol2ey4WS21zCaVE858bGwOyJseyGisAnLHCmi6psgkPIY1Y0iB+Y
         zJvEIcnzBPT4JXAKCmS4EFNQpngemx4yQq+0bPVCZMVmN4+rSg9bLbgaEjW5HPRKUzfT
         yRcry0s6LGMAgCwLd2EwMPvvUH/XzSJxoeIiRQVtxRJZDY9sxmmxGQwaAJzWe8EYlJcG
         aK8d/e/YHa01qTuoDx8HiKBLic9CzzKseOMfARuL5bWoFZXmxDMeIpmbI+4cyKvpXAXK
         AYQRr7SgfXYCkNgJ6TlvZOPYWBCQIcWJE4zN7v/8K5P3jaT052P5IcRScRdMFZ51KwIC
         6p5w==
X-Forwarded-Encrypted: i=1; AJvYcCXWKsaRLzHBq286sceUBA+8SCadUB4BYI0ldWWfp3ddF9w1BNrm3Ah4r+P8bjdNtOAVP6s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq9fRqP+r2Gv+8j9uCfc+oQmF1A+RF5HaCtSu7Ps3qqwPxxU3U
	5qEyaJzWutXoJPwLzFODDZc3u03g398IZj7QkW3QBJn6CaU3cdhN77B2cH8rwG+iRw5O2gAV990
	naVAhVgHx9EEz2TjfY4mD5NNHABNIgtg=
X-Gm-Gg: ATEYQzyIlz/XhxxLRS21i0iX19r77chwh0it5bN6wzKz1z5g0KCSf4nC4qGTyx9v5kx
	XmJQ429p1S3nEoE/fLUvjuK3SjWZPkqd5D8TqGv09jGKdmo3YdxZK5JzULXJIWUczLHMgYS5B6I
	kQ4feZqM4NzTD59BbBYDrIbl76kOU79BLIhjLtpdbzymvQrhZXB8N+JzvA7U+h5zRbk3t6lRY9u
	sE7Wt36Oml7HfqzmlQmVO/NFNgM9AaC4BsjiSGSnGX74Bxt/W9SbpiSxu9D6OD/n/9//yC0trNw
	vgKwApiQjLRvIWTJjsNrB+CGVI9wcI/m4/6ralXlSxH64RQ8o1ovWVoESCd/vXGNICaExYZH
X-Received: by 2002:a2e:be23:0:b0:385:c13b:5584 with SMTP id
 38308e7fff4ca-38a40d6e2a7mr1475161fa.36.1772764743976; Thu, 05 Mar 2026
 18:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306022406.760-1-ming.qian@oss.nxp.com>
In-Reply-To: <20260306022406.760-1-ming.qian@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Mar 2026 23:38:52 -0300
X-Gm-Features: AaiRm52GfF-aVTbn8TmD62YiOKnhcu-hzGhY6Qwg2C8seTj5WNPRzZ_mAb4wZdE
Message-ID: <CAOMZO5BP2aLD+a1r7hVd3F4Qvfovxb8PgQfzcVRKknBHWYBmtg@mail.gmail.com>
Subject: Re: [PATCH v3] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 11:26=E2=80=AFPM <ming.qian@oss.nxp.com> wrote:

> -       { /* sentinel */ }
> +       { /* sentinel */ },

Drop this change. It is unrelated.
