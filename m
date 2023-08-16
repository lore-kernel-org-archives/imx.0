Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF2125B2
	for <imx@lists.linux.dev>; Wed, 16 Aug 2023 21:31:32 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6bd0a96e63dso6005491a34.2
        for <imx@lists.linux.dev>; Wed, 16 Aug 2023 14:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692221491; x=1692826291;
        h=mime-version:date:content-transfer-encoding:message-id:subject
         :in-reply-to:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FA9C06bBTbS1AKGnqoBS1JXus9T0yU0iUb2pyQOWR8=;
        b=RRC1sufs8J9zTjIH8Ysd5uHPw072mQvI+sfUtopb2wyEa+zjwlj0lqmMVIu2F6TkEy
         n4PVR4jd7QRSxxYBiwBabQQzVkkP1ROAKAu4VsDR+IqEqbaaABQyLiRPCWFNuAwGYGD/
         X4qAoWpxeE5NYVsQNaQUHvY/ei0+Gq7ovqkaz8o/1tliFzgU8h+tKcwNNfap+a2+sSWo
         el9U08+XyAfmuPXQ99pU7OVoKfvsL3/h1LpNP04sth5a6mn3aImTRiNSp/SM31/nziAA
         gS/wqYCyYoDK0HRv5dYOpPFzz6LL9HtGp3VxDxJ8ZujNwYQplRQDaYST1+Cj1fHEewtx
         ebJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692221491; x=1692826291;
        h=mime-version:date:content-transfer-encoding:message-id:subject
         :in-reply-to:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FA9C06bBTbS1AKGnqoBS1JXus9T0yU0iUb2pyQOWR8=;
        b=GySLn9eYnj0bVqPs66va6ddzealj14RA8XVilpPlJeOuhO8ccRuecPAIPNq4QJK3Qk
         WVtLMCrD39rJDA0237lxXxRiF5yQV96kE7XbQfgwYV6hxKkW1Ts9RVEyk95Mvf2a7gPo
         ctZoiy/QRvuRdD67ojlmtN9+NT7ngR5gev5lwB3Q7r3Ez9tD0k/lDMgL5+nwgpYKAo3a
         ZWGjBKSwoac146x8KtL7iK4Wqs1mNM+IenRZo7XhBa3AweueUiPJgcCIb2LLgVKYvfQ+
         mmfAuLusinFAesPpBg4nNshwsSW7xLhbBt0I/pXtjZZkHYhDg0xoonFHZzoWYDV/jnhn
         XUzA==
X-Gm-Message-State: AOJu0YyMrNfLMLcPwJ31cnF5G/HW8W6mV0Ml8WWyYpnZ+01bzM7Y36WV
	MnwlNWfKi6FJO3U8DIcsRmI=
X-Google-Smtp-Source: AGHT+IE1Wli3OJp/RJnOG5kEv/X0HrQurBYTTSQXGplFpZSJMphKewPq2UkEiWHyqVFQkYSsgFV9Kw==
X-Received: by 2002:a9d:7d95:0:b0:6b7:30cc:6419 with SMTP id j21-20020a9d7d95000000b006b730cc6419mr3078354otn.1.1692221491304;
        Wed, 16 Aug 2023 14:31:31 -0700 (PDT)
Received: from [127.0.0.1] (cpe-70-112-65-167.austin.res.rr.com. [70.112.65.167])
        by smtp.gmail.com with ESMTPSA id r17-20020a05683001d100b006b96384ba1csm6478257ota.77.2023.08.16.14.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 14:31:30 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
From: Qi Wang <harrynicomama@gmail.com>
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
In-Reply-To:
 <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
Subject: Quick Reply Extension Testing
Message-ID: <99ec35d1-16da-4deb-e5d2-c8458dc38ca0@gmail.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Aug 2023 21:31:30 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> > > > > > Browser extension test thread for quick email replies.
> >
> >
> > > > > > Please Ignore.

Testing link

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Replied with love by Quick=
 Reply Extension <https://github.com/HarryWangATX/quick-reply-extension> :)
