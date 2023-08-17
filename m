Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E6714AA6
	for <imx@lists.linux.dev>; Thu, 17 Aug 2023 18:59:34 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9338e4695so1709161fa.2
        for <imx@lists.linux.dev>; Thu, 17 Aug 2023 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692298773; x=1692903573;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nIPqNznND7cWnACCCvBCKnwWgeYimOwngMfuQIR+Sno=;
        b=VM8fmW+8KMw6rMdXX7oZN6wb9xiSAWL2W7HJoNGMHAdAX4mbdAd7w60fRgOHiyD5tG
         YihPKy/9ADIlr3MLcRMIYijRVPBFZJTvtWqUz+qsulrmixLQf0OMwcHsy09pXOUWiH0Q
         UdcmkzORsWBvqKhU/SFrrou0jcFDnXfz02pWNFcblXW/Gc49BoHl4aJ94WC6s5Tv2/Fb
         bqDTIj+Wpngc/fKcpF4LYJi5dyp+Op8nZSV26pKN6C6Q1M9DifeFbUst13qa7mNAlJRK
         Wm8/TVllGFZj5D6njWY97I5/VUn9szVELjGgibNA+ZFjAYaKzJXlRt6PPtDoyTR7e1Vu
         LzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298773; x=1692903573;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIPqNznND7cWnACCCvBCKnwWgeYimOwngMfuQIR+Sno=;
        b=gakkeyKoqA1KXcf80YxdI5ZxyTcTTnzNq5MxGh3AhltViecq4vdzDH6w/iljYA/xrb
         ZKIX9ts1MoAaO8TcfVEl3NznAvtzCXvG3XesINERguBTzuuPbDOBLYlQADRzSgJTgnVi
         tSGn0eWS1vBLQasMIncSC3W3Tka8QeJL8yWjgWd+xqNzkOFtwIOPJTqb1nuGhgmUfwUZ
         a3cqy91+omE3tZdWeIQ0OegMVN/USeNgAW5OT6hKo7u/wXNr8WgXnz0KFk1ARsf/ZCgy
         bBreT7M7quyARJVtSV1DLOxNLI3oorwu05IOFzi8dajNFH5ch7TkBkQ1f7jfzTDjGlYh
         wZhg==
X-Gm-Message-State: AOJu0Yx7mkZqrz7gzDnKV45sGgAJ9NPHl6UMrq3YnbY6Cy0PRMocizrj
	UXbG5/SCDdhdBZva3ZJG4t38KoWY0d5nx1C2poVbuRHu0Hg=
X-Google-Smtp-Source: AGHT+IE4Fz0RAseu7iIN+G/AYflV92krzE1aL0+l7TdqR5ERsg0VgqSv4fICom6+cBKzpaoNNml0Bxs5sVpQwHXp1xE=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6512:1104:b0:4f9:570c:7b28 with SMTP id
 l4-20020a056512110400b004f9570c7b28mr163679lfg.32.1692298772689; Thu, 17 Aug
 2023 11:59:32 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Aug 2023 11:59:31 -0700
In-Reply-To: <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
References: <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Thu, 17 Aug 2023 11:59:31 -0700
Message-ID: <CAC5d1WKSpo_zJAUDdcSz4oijOF+KBXzDkfHkAgjED2Aiax=EwQ@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

testing send with minimal keys

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
