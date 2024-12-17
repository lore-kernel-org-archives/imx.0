Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD601F4733
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734441625; cv=none; b=UYS992H/k6TCheKhLuCCNp6XLMRvGHBxgfNdyPNjg7y12BRjrAH5UhvBoTEetQfj0xfvuDQvWKjjGyWdRm7QOBU22LAZfJI0QhX3U+xX1zEhYyFl3ftaZhDm5ngSsN9pr2lLSHOvDxWw9eRrEhEv+OKNi7tfYAUaWlE7J7bXImc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734441625; c=relaxed/simple;
	bh=FstVX3CFTj+42MS9laftTg04okRbVpQOvmKeh9DZMHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGzilk+FD77jn5BiG9SWKmmlPFgFNV57IsYBSo1S70lJPB20YkRp7XoKZFI12OpTHPsW5LuFqXMkRrYAwDGcGs4c411noTelkaaOX6IdImyXxGUFLaSU+/RN9y3RaxsZdhpATBo5w2/jT8b8kmkXhRq/SGT6akOlWj/4ICrfeQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tyml8HKp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tyml8HKp"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso5903379e87.0
        for <imx@lists.linux.dev>; Tue, 17 Dec 2024 05:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734441617; x=1735046417; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FstVX3CFTj+42MS9laftTg04okRbVpQOvmKeh9DZMHs=;
        b=Tyml8HKp0AcAsD3luMmHPOYFWfIiJf6FXfCVyu2SmzIJVSJNSfS7Ux3WoDb3wKjdG3
         plL/5YHgf4Vpm1YT1aa/KokjoRFKt6x+rtszKy+XNl2OUgklPusv4B7un0EkdCnSmASC
         2UooMeL7rOFzJaezq7YZWScZlj+6+4EL8Y9zDkAdCa7fo+tyYG2xgeZ3Yy79em438/b/
         kJ9qDyYoIMHnDZDsVx3pX6/LhLej6zt0zXO7bui2i8kjsjz9vMMAL5HskEuIkX9vFrJA
         ufCdmYV6s7CNBB/x7TijAqltV0eibFdRcExsSjDWdLFia7hj2LA9faOgyy7jyzH0WYtk
         b7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734441617; x=1735046417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FstVX3CFTj+42MS9laftTg04okRbVpQOvmKeh9DZMHs=;
        b=iJQBVNcLxI2qM19YiEZvysBAhPP7QBrjC+4ROUfjmP97pGkD4A+3b/CcZnc4y3GVwD
         luS+R0xzyzxDQwFeqhovGGR0Hgn4kT4d+i6EmlzV3LAJaXfJZZtVNFQnL6JogzZW0FE0
         VrvSl70wcAq9O2zlEFOlWEXBzd4iU5PmaELTRYckhubyZztZSivTOlF5zfHrZfvhD1Nu
         bWgoXPLCmnfTBb6Z7D1orA4hqvicUPKZz9QA0NYg8NTbIh6FD+Jg4pKOQ2fyz/jCsY1K
         BNdje73MF35STbJG1i6x1XUjTsuYDSKfHjN4jitfYU2nZvXdfJUsnZXFsnE1BlgGj2pW
         BFTA==
X-Forwarded-Encrypted: i=1; AJvYcCWk3x6NqZtHJsfUmy0avreI+Cqs9e6XZhjqMPJKEpLoiBmILwzNFtbFRYcTXX6l9VnvV2o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQRvdhou86lF3W9XfGA0G9hvqqR4P7S8ORUTicsm2k71eXNjCP
	ODt5lroRw/VYWD32WKObecr+LECh5J4ynAIMgdqtboDnNccVexkP+yPgKu8G6xTq2FFUC4bi4Mm
	Rz/zDTAoCck0EGInD22HSWPeOO6A=
X-Gm-Gg: ASbGncsykK6Z25ndKR3fSLwpDqAaKRUtNUhIwEFqMpbJHPLAQ0jn9e6gLXCGKA+Cu57
	/YVdWlQsJ3NonXCrDb8F4Y98t25QOWXerx/1V/E621bGJaANLbhEX5cuDDC4KauL+LKV5
X-Google-Smtp-Source: AGHT+IFFx90kPbpMheYOE1177/QLK8nVCI4FlXeGlR99M7gIZTPd37rucl/NQo0g2oJIrbiMhA6SNFXFscAA/m2smM4=
X-Received: by 2002:ac2:4e04:0:b0:540:21d6:d681 with SMTP id
 2adb3069b0e04-54090555494mr4984098e87.19.1734441616935; Tue, 17 Dec 2024
 05:20:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101135406.47836-1-festevam@gmail.com> <173073495749.210192.9138587910771237679.robh@kernel.org>
In-Reply-To: <173073495749.210192.9138587910771237679.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Dec 2024 10:20:05 -0300
Message-ID: <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
	conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	krzk+dt@kernel.org, a.fatoum@pengutronix.de, dri-devel@lists.freedesktop.org, 
	andreas@kemnade.info, marex@denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob,

On Mon, Nov 4, 2024 at 12:42=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Fri, 01 Nov 2024 10:54:04 -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > imx6sx.dtsi has the following lcdif entries:
> >
> > compatible =3D "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> >
> > This causes the following dt-schema warning:
> >
> > ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> >
> > To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> > 'fsl,imx6sx-lcdif' fallback.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>

> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Can you apply 1/3 and 2/3?
