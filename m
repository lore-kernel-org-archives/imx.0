Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99130139C
	for <imx@lists.linux.dev>; Sat, 12 Aug 2023 04:48:04 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-523476e868dso3356264a12.3
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691815682; x=1692420482;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NH4sclJtZTEQj9c7HFfHEEdQgizaUVloaFvpIBOBml4=;
        b=ejrIa570Hm8D1DGxyswIJFNs/SHUKjQtQT27iZ+613VYmn65TjWySTtwBM2f672A97
         sTeeAFsqAlKE0J9HGGHfB9/kAqiG3ca3NxcBDYI4fAL07QhnAPiJaVqtSwMFCAcDTgFj
         pq1/DmGwq0XHC/gYOX+oFy43NYLhB9PTRyPjTK10y/wPSuU9jWerxrmkrpFdfiEe23AC
         VsnhomaMqtqdhaTCDn0dzHQ0K8BYeTN9I/r/NAllOf7Sxdx1iK74qLcY92fpb1G51T0e
         OmELVRqpcosolNQhNynFlc/ArAUEpwVXCffscAPL3smHQuzklqFrpHUsQZCC9H4/6QQI
         3Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691815682; x=1692420482;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NH4sclJtZTEQj9c7HFfHEEdQgizaUVloaFvpIBOBml4=;
        b=FlU2xM9wxs3Z6EfLkz35DWta8ksAt49rgDTOUjj70cWcrqujLui7D5h/kxataspB86
         t6Y1dpO7NYL4v8H1jzHhlQbxDAyeS+O7dZtOgtxR+OpxLCFmvZl32TFWldQywGHNKa5L
         B3VgZnrvxPoimg2r0hw1pFytr3D2KPCGRBt64jOHkObhCwydfEQDHPESL5zT/ARqt23r
         Xf/TQeI2ODQ+cwEvh3kBE9Qh7ewpgVmWniE4ox8MD38eLoFTcm0iSPPhEQdvaiJBdxlI
         6AF8/uJNlF3Jyq1VdXipfovGP9NaiWp4UEFeLG3MdA0oy7bEWQQsv+pyX6oP5Fm9I45t
         c4bQ==
X-Gm-Message-State: AOJu0Yzej6y61RMH0K03rnFxDx6VjpqkUL4gn7ALQJT7h/tgCXOQlECM
	utEQmS66nPXrTFynsJDY2PXfItP4bojXHY0F5d0=
X-Google-Smtp-Source: AGHT+IEfvySGcO6ox2l7WCeJNhyOM4fgZ40AgPnTk0qldh/Vi6gdkXVGddh1IyIQtcqtzL+btFNyXBcoeXJUjf4iSGw=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6402:50d:b0:522:37f1:5fd0 with SMTP id
 m13-20020a056402050d00b0052237f15fd0mr3332397edv.5.1691815682458; Fri, 11 Aug
 2023 21:48:02 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Aug 2023 21:48:01 -0700
In-Reply-To: <CAC5d1WKq6Z0NqC2=SKd4OE5-DJMw_97Y1Dxm4NABa2Y7Z6gdCA@mail.gmail.com>
References: <CAC5d1WKq6Z0NqC2=SKd4OE5-DJMw_97Y1Dxm4NABa2Y7Z6gdCA@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Fri, 11 Aug 2023 21:48:01 -0700
Message-ID: <CAC5d1WKUGahDZh_y=anxXn=yTGJaRF2p78E_PozZ8C5bcEO1PA@mail.gmail.com>
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
> Testing quote structure.

Testing dynamic button status.
