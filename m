Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2523A1849
	for <imx@lists.linux.dev>; Sat, 12 Aug 2023 05:01:18 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99bdcade7fbso352061666b.1
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 22:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691816477; x=1692421277;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ltVfP9B5t4kcSOEfOlk9Cx7CHogckXyjV/UtlvybLY=;
        b=XlBeqZpAmyhFc3uMa7FYwSOzE4Rh/zeRGa2J1bBuMoqmMoQlxagjcesN0l5VdPv49m
         g15ijz9MKXfgtxn+iPCgzOznDiMY1BWhPAA8SpseEAzhphBTBxaLBGSlT07prSx2WfLA
         3o2oSZvZFJCeRsMnDmGHSUbf0iu63ujaOeTw6XCoAQ9vkvzQ1O255dLnwtT0DJJjN4Wc
         3Ow8mD2LU2d5sNQVKcUikMiNkaa/JyDvt2ojyUeBXt2qiCs4dkIvsAsRUtKrbCEmT/7k
         xj7y2/zlEFKVqBOWb90tT67TzgPggR5LCVJKgRytwAY++QAgsy+ejrFn0oMvuP+dW0hf
         5Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691816477; x=1692421277;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ltVfP9B5t4kcSOEfOlk9Cx7CHogckXyjV/UtlvybLY=;
        b=bITa8zYKjt3lWhNb0A6x2h3t0+Yvxog8KXcpVQeiPsN1OfJNSyN6FrYY+YKU9A8BVv
         JCEpPZPPf6hCVxzw/lmLAWsDXaY0xHTtrctlUsFb5SILEEUSQlnQs27pQaFw4cnmeaEc
         CBD/tMfpfCj/aihA31/N2NN9u5wm89BRaCfI/ELnKUHqu3+vNsRDBBazyT3yfMQTBUxb
         FanNrj3CCUXoT9vfs19JV85tSOwguwDiAvnyuAydhfl3/y2tCCSlo28U8o5XHmARRgdv
         4eN68frclE7YBZU4BmH9gGx2qm/+5tP3WMtxOWh6kSJ6WGWLon15c100oDEZJSI0mK5q
         80OA==
X-Gm-Message-State: AOJu0YwbUKiaw4zWfNsO3Q56TgEtNwafmrQTM1swYvAzy6y0N0f38553
	md2vQIAW4t76OogjlWlSUSxM6f/Ea5iBzRKwY5M=
X-Google-Smtp-Source: AGHT+IF9MXBvGcW5dkqivdxDADpF96Q2rLddzNU/2MbdKIVIrpBS9Ytn/D+GV8F8HrlWpWJ9xb10+IFzpNUB5peS9AI=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:907:b10:b0:993:f540:5bb1 with SMTP id
 h16-20020a1709070b1000b00993f5405bb1mr3350049ejl.41.1691816477075; Fri, 11
 Aug 2023 22:01:17 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Aug 2023 22:01:16 -0700
In-Reply-To: <CAC5d1WL-f1VJRG8GP1iTD+6=77dCABTLccNGN7mocrMfPsLpZQ@mail.gmail.com>
References: <CAC5d1WL-f1VJRG8GP1iTD+6=77dCABTLccNGN7mocrMfPsLpZQ@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Fri, 11 Aug 2023 22:01:16 -0700
Message-ID: <CAC5d1W+=DxsHcGsPQ5NjKHbTWGgNnQuyQkj23imyz3dyMe6gYQ@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > > Browser extension test thread for quick email replies.
> > >
> > > Please Ignore.
> >
> > Testing quoting and email system.
>
> Testing quote structure and in-reply-to ids.


Testing dynamic buttons again.
