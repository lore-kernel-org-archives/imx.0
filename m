Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A82C470130
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796569; cv=pass; b=WCs2tdrTjJ2rmNCzlhi+mHNBaQFX/mwbPeQNhIfbBGzTr/BfRpd4toIcrQirEsTCvmuJaqrq5QJvYiI+UB91Vgm5nAyOWpZcZy6oxxXLOMhzDYcEIY1J8LoUDJjV5VbR6zyeG+zzQUDkNlOc+lXWZEwRkrXIdJMaIANgwpOoafk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796569; c=relaxed/simple;
	bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0MTHbO8IfzF47148qLYUzWuN09+Sba1ZqoR7t6lUZ/dCdDqCFBalRN6HT64k8nTDK++WirDYZ7Z/DL6Z69aazuqPBcZHeeZU86cxsR+FrA27lwDCvXtzFVkQtvAuGF8Kbe6f1grdpwa1903zaxe1Gb9q9lRnnPM6pngUy/Q+ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNYdzWfj; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNYdzWfj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c29c6a3930bso204118666b.3
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 02:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796566; cv=none;
        d=google.com; s=arc-20260327;
        b=B0tPk9n8ZwoSmuy/lmVk3V5sVCHLBdkzd3cwtvbH873p47Ee2XWAE39+a1ZA/0EJ2e
         krYGOieOqKVXPrVuESBEe6q8pioO5+P0TMcWhc0imQoR4t42JmgBjzxXzewm7aY3JOgr
         t4EPo/TkWeGKIWy+U/WJdvSvlsrjLY8XyM/Gyi1pgAX46+gW8TTKningBFnJsTwXrP/k
         5dfGZXN/95gvIotWgw7bk3+Kw7FjP8kS50PUbdcroD6oby9ycO7GBb33G4mOPB8vSN3+
         eG99Pze18z6bkIVUaPwxER/7+cJiuGF6d8YeRh6ock3MPEhDDWLuzZLenKDsOL/vQe7C
         jx7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        fh=jUkx6rQGxJe7YJvllTw6eNyQkxYTWLy87gUd0spWa7A=;
        b=sRvYxAD64NTXpeVSNjYO8DmzQ/2yMDg3GjaDsQNiw6HaRy4bLG9IKoquCYVxEkyb31
         fUk0+HRJd8gLl6E0z3kU9PXtAWqNlbXY6078C2wXWU5mqPdtJPaRptXMk58g/WTn+Z7w
         VyWOqXP8DUCgLbIYZyTBR+e31klVZd85EypldMCubSa3xTCjjWowFLeNkT75gStox5ky
         MqyQbfY//If1VYy4ixuI9hnemdPyy0A02JwLyOMadYiI+a9Y3UImKrJTYCRH3hR6iPsA
         KZSmtxU3pDbunFobeDm8ao2+6NvLFGbyBbqEnsaC3FCDw2h0vkBvGM2cavPqjie1IAiD
         aEBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796566; x=1792401366; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        b=NNYdzWfj9ccUcpz+/e8KE6V0iOwCjVOV2V7HGEw99Ol043+rAkiteCYPUpNWTm5UPQ
         JIv6f6SZO8XJEY0bbuqdxX1dzeDSG+8O9UmUrZCtYs+f3AYl97W0A0wSSHUqEwa7xaaV
         emIuo6VU92U9OCGAHzpYFRn5p1Ip40Xcw9PAZBI4f+q3IeO66MwRmzUM215tz6sBZBpx
         C103gXopM0o3fnQd1YjP3WfO0mTBw8OQk4QiIhwNomRE5kcidON74boZG3Jacq6elsH4
         21pjjYZfV5uJ6gfqym9YlAbCByC7Bpxj2cTPQiYtgASotfNks/hZNq2ezZ05900rtKGP
         glMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796566; x=1792401366;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Drzvt49CpeOh1RLsB1Atdeu2NC85y5Tl0IIhLhry96Y=;
        b=IS2jUhNlLDIdzdyWMtaT24CdaKMk+JoScWjcY5rnyHQIkm52jQgqGG92WjQeFU6suC
         VwfxPZjtypXV15OqUkZjDxy2Kdq7TYbwdsukE38PDlt1F0NtY0+aBIvD0qijnf69wVii
         fQnH+LtoaNw+niPDIxWlfFuaRvZT6J1dxztFMdzft8euP1hReluhGe0HUJRGSBYa63PH
         ZP9rN+1JPxW0G61937MtuFpls7uAbzDv2AsF/uBl2hqqbOB80OXKS3pPJaviZ5fQ0eDF
         UGBNGBdDjIc3sfi31yjL49NIWV5+h8915OftS3QQapsYVMZgGPJtQvCaDTDIDOeb3jnn
         Jcqg==
X-Forwarded-Encrypted: i=1; AKwUvBwjsnyFyhWB/PDCvfriXl98LShWwTAkhc1lh9NnBNXursXt9JWx4JCxu7zgtBpNQhw7mhs=@lists.linux.dev
X-Gm-Message-State: AFq9FYK6DOh+mqYQDC0UfuKr8cE9t1B03iZWCwo2qt/OTyI9LXOwK4tA
	8OqZW8HUwM2uFo2xaU3QaiBovF6W+x6KV7BfB2PI9AFpKX3BBrO3Nwrhc8UuXCvAob10njj6tj9
	KL3zodEJ8GMkpHPdW+Pd885oxn2iM324=
X-Gm-Gg: AYBFou2rICaqPu2aUrvz4kbMdzz0UuBV4CLJfFBHCZQtVn75+4FwiNdYzCcNS/0bH/b
	8NL97MKg0J5jdgTJAZ6uBHXbjqZe/jOg/0RU7vQNv6xyBLGIqNsGIqk5cN3fdbdW+2iS+DMpU3f
	tVLemcZYSJw4+revTm4rRB6sAicdJknwuWohskb6AnUWl1/n0h5lQOG8eATt5A1ylEsGhB62DYo
	gYO6ZErWWiITGeKxcb/O+yUKyIxUN1W+oU1WsX8yqsXzwZ/67EvP3qblZMkEwi/1AH9YAbiDGcs
	4nQqEFG68KBUVdyp0ZvAe/sVHSHtvO5izLlI9oLmgXz7OaUwR/b5MxjANOijQc6RD7N/9pxHDoa
	04/3z+jgI1FCTHmaPjkr36nADsCBhfccAKAgGFC8f04UfqBfgwmFLIfEo/PiHQIB6OaMObFHlVi
	dbU4gCIPgyiktfG5zT7/pyMjOlsjRZ46d/QJBqif/0
X-Received: by 2002:a17:906:7948:b0:c29:60b7:3f14 with SMTP id
 a640c23a62f3a-c31aa02b449mr838815766b.46.1791796566369; Mon, 12 Oct 2026
 02:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:15:28 +0300
X-Gm-Features: AclHuK973sM-FWRDdJi0fSTDjgQG7reB3UnWpT5L7Xl9I9NH2wEexbwNU5tVEtc
Message-ID: <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port, so use atomic bitops when modifying wakeup_pads.

The code doesn't modify any reader part of this member. So, the above
paragraph is incorrect, right? Otherwise it needs to be clarified how
assign_bit() does change anything.

> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> wakeup_pads to unsigned long and reorder to avoid wasting words.
>
> And fix the enable/disable path unconditionally sets/clears the
> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> Only update the bit on success.

--=20
With Best Regards,
Andy Shevchenko
