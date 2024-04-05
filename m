Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74031171657
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712338743; cv=none; b=WOqAMaStkBovxiMvHzRNNkrovJgSIpk0pY09Fwf5PYGdS8IRpgAJgS6JR8XyH+Y/7/rUcIEAn3IFA9eQdsEPsmAXmEGZN4X9UXKFEmccL1/keWy8TPjsdZ2WM3IVUMSmNxQYZvP9Tgvn+F7fc5VhL+4uIlj8d2O3gGlNT8271mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712338743; c=relaxed/simple;
	bh=XkNv1Lje8tREP4a4egM0yUzbQRvo5OybpHj233Dw/9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2ovSSJ7jjiJF2L3fwC7kQSYxc99p36TJo/X1c3Zt2GAAIqLT5AdmeAtOwwW1czQSlu/7kcATb09v5gmcObWdpFnU5OHMGdPtsMNYqNkVTg6iTPXgtkOBGdd3VRz1qj0cNCt7eCKtx15OFr/+zfU1/a54UWHlJqSoyGVsIcCO1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eh6dE9eD; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eh6dE9eD"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-58962bf3f89so516531a12.0
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712338742; x=1712943542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkNv1Lje8tREP4a4egM0yUzbQRvo5OybpHj233Dw/9o=;
        b=eh6dE9eDJf3mRT6AE1mqrkPIeoUpKVpWeOqanrWHY5r/9Suzb2tbVnYwPCySrIrElt
         R05Fj3RwdjvzFYv6eHpRAUcdnGRt5Up3w67I626VPONZBiHUKywNb1m0ybCqE/Lg3eNZ
         pET7ZoTc90MCxdDzu8BkTv6u9Lu2E5Oc+NnPlPDYdcRLLpdstlEJ0BgsimylcJTzsvAq
         YJk8fK7xkLQ1BTdRBPvrYiUx+n481ySGwpbRrYV9Wy1hrwoKjuZFkH5E7pzIOVPhAN8h
         s7Jil1/NkYr0xLPhPu9h104fLnJiugyZasRdyXqMorh5pvl9E/q3uK7PsJvU11OC1XUi
         yeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712338742; x=1712943542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkNv1Lje8tREP4a4egM0yUzbQRvo5OybpHj233Dw/9o=;
        b=eUc8Qh9VSvYo3d3PqzVb6e3gUUwQ8Qv8pHIMzRRtAVEMOAC9rzsfPIxBbWBqo/ukDh
         LbOBkqvY8axcJNCxWE2p6f3A50IGej/giKszytIRCfqWjGVa5ttEqMOLrt5kB0B1m54G
         tB76QIHqBEt/KvoysMQ/03jhU2m/OcHJtn0BDtV19QgCprAcMve7+Fj9DL8mIPzZzL/J
         vXCLEzg2QfaB0peQY+hTf/tJVfsX7oiusZv0lWihiRsDGWaJLfVrB9yL5ZPLRQbZ0Od/
         oBRiCIPav8yc0wVYfZiGt81Nczx0O91loUAaW9sLLqsJAGOGW6CcGGHQhP8Z/7GMWyXn
         z7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUWywgEm8QShpX1Kr+IwA/RZlpfGYBmvfdhF3Cwou7TKWuPAwT5Wh8DbKJ/1lOoARxK2EO7vygrc7WoFUAchObjiZJx
X-Gm-Message-State: AOJu0YzXoQFt2PHMAwQXOhg0l1tqsN8rx6eEfGo6fgfBP3aXB/xDW/3x
	m8M5NeT3Cff7tJ0sIbi34xWPW5CDfMjh3CpLlWExl5lOO6WhtoXao+p5MABmmylvqwYvNGG2pG2
	vF7Aa+FY0Rtoi5DYSN42bg9Z14zA=
X-Google-Smtp-Source: AGHT+IG0fdWiO/DDhWt+ydU2XsAmvp8DjslGdEn7xhs3xLBJ4xyuh09Wa2suF3tZOlzI8PazH3O11cA/0Kf1hRuxMYk=
X-Received: by 2002:a17:90b:e89:b0:2a2:386e:3921 with SMTP id
 fv9-20020a17090b0e8900b002a2386e3921mr2035370pjb.3.1712338741681; Fri, 05 Apr
 2024 10:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <76cf9ce9cbf9dcdf78bc00ce7a919db1776ebce1.1712309058.git.esben@geanix.com>
In-Reply-To: <76cf9ce9cbf9dcdf78bc00ce7a919db1776ebce1.1712309058.git.esben@geanix.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 5 Apr 2024 14:38:48 -0300
Message-ID: <CAOMZO5Axz7un+9H2uEoQtE0=pYNC0hEyZiNobrSi2m0ajj8N+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: imx: Introduce timeout when waiting on
 transmitter empty
To: Esben Haabendal <esben@geanix.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 6:25=E2=80=AFAM Esben Haabendal <esben@geanix.com> w=
rote:
>
> By waiting at most 1 second for USR2_TXDC to be set, we avoid a potentita=
l

s/potentital/potential

Could you elaborate on this deadlock? Have you seen it in practice?

Should a Fixes tag be added?
