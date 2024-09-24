Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B2E1A4F22
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727176240; cv=none; b=VMpG56YnUWk9pcFxFZxROXtXnehiClQBtB/gRGgJc6B1JggRMg/3GMKPWP6xnzhWd9VHOrovlxDsu2ur9npa0k/D9vOI7fsyPeMRY526BIpP92fXew/EL39L54uVDSRbJgWm2tjItl45DhP79ZYvlcS27BxAKHnta9a1mFXP27Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727176240; c=relaxed/simple;
	bh=9jnzMbHQubQ0AnJe5LhoAtSQybAfXdyRtiuYCOafWuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pm3/YlnU/ndiccVl4ofQVFS3xU+32rN0w8PDZvn6Kb2kT6Haxp/3CZUbLu/1DOiXui9m1fxdT1VS3T5oKIWbH3TTdrlPn7duBlWhQoBNZZ0Tz/2X+mzHzTKiR39AKCV6bWZ2h3bV/rNLYVUBgRBb4NUGoogCtUpWZ9tcBoUkrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyAmKrj+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyAmKrj+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so69474305e9.0
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727176235; x=1727781035; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jnzMbHQubQ0AnJe5LhoAtSQybAfXdyRtiuYCOafWuA=;
        b=CyAmKrj+KaS1mw2yXfchGw3n3AkTiPjly3J/7gjgsksQyQ8SmVcDiVREloKglYhg8+
         mc8LDS7mxA0mAh4i+xtLZ/ADAr7nJriTTDFo3LGqK9H3/v0nno4dk0mKEiP38WwGNn8/
         yGHwRotJZKcjChQa8w3eBmVZqXZ83Ic0I03KcbwQ9jTF+DHB27DRcxVJgdJW94Yp7GL6
         KnK7gTc5duIhGQgAnPi3wI16tw5Yso7KjNNyt5wC38crLN39jSke672/ufcOZN0Kpnsm
         Cg5COBaYzHn73EKAlLMqwsk2kO9sWebC4yo+XLJh74omTry3Y6gw/mL0OZ3XBrMmNr1k
         2qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727176235; x=1727781035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jnzMbHQubQ0AnJe5LhoAtSQybAfXdyRtiuYCOafWuA=;
        b=iCJR8MnbrvA2x1C51O5m03rb45cw0zIk58zSdUOiH92bp4ZDpgD3USacw3kCJU/DFR
         rNYlN8w3L/okQrayHaeeCusU4h29VCoDRyWCWrje1VSbKhgxW0cf7u2iNSTIc+YX2U8r
         mTOS/olEaVqBOSL9CjCl4aiyILQ7Us0ki3W97wW0ABctLopq4aI7D5j/W/9cPzvgEPXf
         YbjygUEYhWaziOpsdXJrdNTyMMZDnfS/0OuoE+XXxWCPqD/t8p0G9Pl1HrcbYuRJomzS
         X/ejdJRsia6uN0QvcDk58sHIQlX/yJAt8imlQCS5vNJhTfum3DvtsOj/t8nYtmQ3BzXx
         /llA==
X-Forwarded-Encrypted: i=1; AJvYcCWZEGH9wjSzuc6tDwKVXONjfkVni/yf9zWbKkAYV8loabJk77gQjthdiCxpE6L+G+jOL3Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNgNOolEAI3bzJQdGCxvnw82uhOouLxgyymCMbGdSo6W0wlU/2
	TW6jnX9xTSyVO57Cx8bZnA8zr3GGarVH4v/drnDPrAY7vbxVhC56BENMaljEhzAdVtIpiN4QBp5
	Z0HVtGAsdNqjbmACCfMNieOhHbno=
X-Google-Smtp-Source: AGHT+IGVdaNowgn71S8XI4E9u5lRgpDLkBXHGgayJ1Q9AYKIR0GLcBZmOfxHttIANuknf5+VKcoYDdRLSvxJdXEcGuk=
X-Received: by 2002:adf:dd81:0:b0:374:c231:a5ea with SMTP id
 ffacd0b85a97d-37a422533b3mr12533743f8f.5.1727176235428; Tue, 24 Sep 2024
 04:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com> <20240915114311.75496-3-laurentiu.mihalcea@nxp.com>
In-Reply-To: <20240915114311.75496-3-laurentiu.mihalcea@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 24 Sep 2024 14:11:35 +0300
Message-ID: <CAEnQRZDM1R+5GX=8tNCaOXw6-Yya142RTSgsNPErv4KjFcpcJA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] reset: add driver for imx8ulp SIM reset controller
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 2:45=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> Certain components can be reset via the SIM module.
> Add reset controller driver for the SIM module to
> allow drivers for said components to control the
> reset signal(s).
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
