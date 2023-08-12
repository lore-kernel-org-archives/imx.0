Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E115B6
	for <imx@lists.linux.dev>; Sat, 12 Aug 2023 04:00:43 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99c3c8adb27so355187466b.1
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 21:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691812842; x=1692417642;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=axOF449vXZRNPzgHw4aia7aM1G6Hq71tdyyfEhCOqTo=;
        b=Zeb7NYGKVOVct7HJd+Oua2YAjUmR7YzGqzP8UG3XY0t2YShcKeEa24w7WtMymsZ1ls
         anOnS+H56DoxFn7+tKvsDsULyWLY9QxUZjtqE+wHvMxZrVv5CbP/sIOGvugVuENFkbC6
         +8BOSSMBlOEq5yE9tnVqg3dJwHR3gmY414OGg4yW/obMmKPveS97k3GsXvH32XLY3S4T
         Zj12cfCUoyj53gv/o2cAaOZlICJd13Ln9C+Jz5kZRV37BS2VxNkXKNx4y6QTJQ6im4wr
         smVOE31sqxzzCRHb9BJtHsFbzUtb+kRFPvAbrgqfJOySnZXc6H40PQDckyIPswgK41ZW
         3/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691812842; x=1692417642;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axOF449vXZRNPzgHw4aia7aM1G6Hq71tdyyfEhCOqTo=;
        b=RhpFXkhwfcye3DT0U0TE+7JBAS7q4ootthmtozbtuf2QaM6uK/a9QOeI11/ZCMn7j9
         7sFYXqV+l2WsUfg9aiZzYkpZ3bpKmFEy5qQVXmGwHAtrvi1JX0s8XagAkfX4I08m2eAG
         IGy1pECSuW+twjiOZItDh/t0itaz5kYB/hnoDPDni/5hftvcItpkgwZay5s9YgnTXpAP
         ZXPH1yfaZlyik9/JOeVkM1QjJM4+sND9skpA9B2juF9LaQyNgWwF7YeKavOCJk+bMRfl
         U5vdw5CAIvuqVvwuYUhCOFexcsOKuJXmAsaPEJORrq7Z7nYBXOl9XD1qroIlR58xs0SX
         hT6w==
X-Gm-Message-State: AOJu0YxDnORhyrzCgYdj2l1w3M3hGWCMh9RCqvi1/d7elDQ9Zu8SRUUR
	sNWU6GAYaeof4wFzQvyRzV3hYUPOxM9lCvl8eMg=
X-Google-Smtp-Source: AGHT+IF5zprTFvSV7alCBEJFqpaSmftJOfd0SaNVXiaF6TtW5G8noQTs/hkzpLYncHL6cAAgAFAhFtkAkKrbC5Tic74=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:907:784f:b0:991:d727:6977 with SMTP id
 lb15-20020a170907784f00b00991d7276977mr3323417ejc.38.1691812842183; Fri, 11
 Aug 2023 21:00:42 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Aug 2023 21:00:41 -0700
In-Reply-To: <CACRdBt-5L+r88m2nGdKFo+zk8H0VKT67UKSATtO1FK2OZsyywg@mail.gmail.com>
References: <CACRdBt-5L+r88m2nGdKFo+zk8H0VKT67UKSATtO1FK2OZsyywg@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Fri, 11 Aug 2023 21:00:41 -0700
Message-ID: <CAC5d1WLA9UYH6=zxyz9hRNuX2Z4ZZGS=D9LNn+jkbyRc1RrtoA@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: extensiontest66@gmail.com
Cc: imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Browser extension test thread for quick email replies.
>
> Please Ignore.

Testing quoting and email system.
