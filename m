Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712F918B01
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 16:13:39 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-528913c261bso2090677a12.1
        for <imx@lists.linux.dev>; Sat, 19 Aug 2023 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692461617; x=1693066417;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wyyRoXuxyp8e80FWbkGaAXddyGGBj/MPoQLTIolu1+4=;
        b=AZ6MM/g613Js+bjWXAj9XLk/bUPCP3VLW77W/o3jypjiBtjPovB34T5zOdncopJ0WA
         bfeHVNSRSTMl3Y4UzbyCaVISULzphzDWuUu2VGh43UIutYbZI2nYxcQXLkhMe3rJQEXE
         DbcesA1Y3VXICU+nQtoYPgmBW5Lx8sKQ2iTN9JVzYlf9MAMj0Uv8CgPRcyjn5XLFW3Ms
         0+faQvbmeMFdZiKHErVOo3nNei2oyc5SWO/2ay4l1GGHQlnk58rPTUVA6bnwHQIvNOfB
         1/wWSlbqot7lnGAOFca/BXuDJwHfl7hnY5NUOBlShJ65w+nijuPYwkJeYRE1zfVojZoX
         pDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692461617; x=1693066417;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyyRoXuxyp8e80FWbkGaAXddyGGBj/MPoQLTIolu1+4=;
        b=ZG0tpgZNYqySbYoLNhGv3m3FGoErCuRSummFbM+CmdKA6VEHDYqNY2WBxnk1BGsyh7
         jcLCQUQRnbbZ+zyN+JJJ6K3wK5fcl0SuzqMFiuAoCt20OZ3ZSjhQXidyg0dTISWb7iD1
         UVhsYBbT0xdP/rLxOZPK7+wjkmFLjo37tXTJOC6egHjewQEwV+JaPEw+7kn1WBwA/PnA
         NcBS2UfvJyw8ZJ+I+eq+/gGUti+wh+T5vJv7QF5tP4YfeVBK25MFAeRANoj41LMID26F
         re+uMqIWT7L4fg8PfT/crdknhoimDybbehKcrDUNo9mQ0dkq8gVAgzq3vxsWkcYY1dcu
         fZDQ==
X-Gm-Message-State: AOJu0YyRUz8h+IcjZtRNoXyRTIDUZvOl1+ghLlx9+p6vFeT7QE4neWeo
	u0hFxBQDumQ3u2lXCfc2aN9XopKxVvzIh36n6vI=
X-Google-Smtp-Source: AGHT+IHbPqpyLRMKBIwTqKiAbasV/gOmScAa4VBVzc2wcfqWZW0wkvfZAeaO+TVHYUsRTCz3nzF/ex4M7CNoyUM5PFE=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6402:1610:b0:525:70b3:72c2 with SMTP id
 f16-20020a056402161000b0052570b372c2mr1756261edv.14.1692461617341; Sat, 19
 Aug 2023 09:13:37 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Aug 2023 09:13:36 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
References: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
Date: Sat, 19 Aug 2023 09:13:36 -0700
Message-ID: <CAC5d1W+EqKOSKTK+kH-jF+=42LoJq5fXL-5Xgk6CL=L-zsY-+A@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

> testing api


final testing

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
